import 'dart:async';
import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/get_cart_items.dart';
import 'package:e_commerce/features/cart/domain/use_cases/remove_from_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/update_cart_item.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartItemsUseCase _getCartItemsUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;
  final AddToCartUseCase _addToCartUseCase;

  final Map<String, Timer> _debounceTimers = {};
  static const _debounceDuration = Duration(milliseconds: 500);
  CartCubit(
    this._getCartItemsUseCase,
    this._clearCartUseCase,
    this._removeFromCartUseCase,
    this._updateCartItemUseCase,
    this._addToCartUseCase,
  ) : super(CartState.initial());

  Future<void> getCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await _getCartItemsUseCase.call();
    result.fold(
      (failure) => emit(
        state.copyWith(status: CartStatus.error, message: failure.message),
      ),
      (cart) => emit(state.copyWith(cart: cart, status: CartStatus.loaded)),
    );
  }

  Future<void> clearCart() async {
    final previousSummary = state.cart;

    emit(state.copyWith(
      cart: previousSummary.copyWith(
        items: [],
        subtotal: 0.0,
        total: 0.0,
      ),
      status: CartStatus.loaded,
    ));

    final result = await _clearCartUseCase();
    result.fold(
      (failure) => emit(state.copyWith(cart: previousSummary, status: CartStatus.error, message: failure.message)),
      (opResult) {
        emit(state.copyWith(
          status: opResult.success ? CartStatus.operationSuccess : CartStatus.operationFailure,
          message: opResult.message,
          cart: opResult.success ? state.cart : previousSummary,
        ));
      },
    );
  }

  Future<void> removeFromCart(String productItemId) async {
    final previousSummary = state.cart;

    final updatedItems = previousSummary.items
        .where((item) => item.productItemId != productItemId)
        .toList();
    final newSubtotal = updatedItems.fold(
      0.0,
      (sum, i) => sum + i.lineSubtotal,
    );

    // Optimistic removal
    emit(
      state.copyWith(
        cart: previousSummary.copyWith(
          items: updatedItems,
          subtotal: newSubtotal,
          total: newSubtotal + previousSummary.shippingCost,
        ),
        status: CartStatus.loaded,
      ),
    );

    final result = await _removeFromCartUseCase(productItemId);
    result.fold(
      (failure) {
        // Roll back entirely — request itself failed
        emit(
          state.copyWith(
            cart: previousSummary,
            status: CartStatus.error,
            message: failure.message,
          ),
        );
      },
      (opResult) {
        emit(
          state.copyWith(
            status: opResult.success
                ? CartStatus.operationSuccess
                : CartStatus.operationFailure,
            message: opResult.message,
            cart: opResult.success ? state.cart : previousSummary,
          ),
        );
      },
    );
  }

  void updateCartItemQuantity(String productItemId, int newQuantity) {
    final updatedItems = state.items.map((item) {
      return item.productItemId == productItemId
          ? item.copyWith(
              quantity: newQuantity,
              lineSubtotal: item.price * newQuantity,
            )
          : item;
    }).toList();

    final newSubtotal = updatedItems.fold(
      0.0,
      (sum, i) => sum + i.lineSubtotal,
    );
    final updatedCart = state.cart.copyWith(
      items: updatedItems,
      subtotal: newSubtotal,
      total: newSubtotal + state.cart.shippingCost,
    );

    emit(state.copyWith(cart: updatedCart, status: CartStatus.loaded));

    _debounceTimers[productItemId]?.cancel();
    _debounceTimers[productItemId] = Timer(_debounceDuration, () {
      _commitQuantityUpdate(productItemId, newQuantity);
    });
  }

  Future<void> _commitQuantityUpdate(String productItemId, int quantity) async {
    final result = await _updateCartItemUseCase(productItemId, quantity);
    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CartStatus.error, message: failure.message),
        );
        getCart(); // resync — optimistic value may now be wrong
      },
      (opResult) {
        emit(
          state.copyWith(
            status: opResult.success
                ? CartStatus.operationSuccess
                : CartStatus.operationFailure,
            message: opResult.message,
          ),
        );
        if (!opResult.success) {
          getCart(); // rejected op (e.g. stock) — resync
        }
      },
    );
  }

  Future<void> addToCart(String productItemId, int quantity) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await _addToCartUseCase.call(productItemId, quantity);
    result.fold(
      (failure) => emit(
        state.copyWith(status: CartStatus.error, message: failure.message),
      ),
      (cartOperationResult) {
        emit(
          state.copyWith(
            status: cartOperationResult.success
                ? CartStatus.operationSuccess
                : CartStatus.operationFailure,
            message: cartOperationResult.message,
          ),
        );
        //getCart();
      },
    );
  }
}
