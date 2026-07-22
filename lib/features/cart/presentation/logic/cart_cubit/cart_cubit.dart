import 'dart:async';

import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
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
  ) : super(CartState(items: [], status: CartStatus.initial));

  Future<void> getCartItems() async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await _getCartItemsUseCase.call();
    result.fold(
      (failure) => emit(
        state.copyWith(status: CartStatus.error, message: failure.message),
      ),
      (cartItems) =>
          emit(state.copyWith(items: cartItems, status: CartStatus.loaded)),
    );
  }

  Future<void> clearCart() async {
    final previousItems = state.items;
    emit(state.copyWith(items: [], status: CartStatus.loaded));
    final result = await _clearCartUseCase.call();
    result.fold(
      (failure) => emit(
        state.copyWith(
          items: previousItems,
          status: CartStatus.error,
          message: failure.message,
        ),
      ),
      (cartOperationResult) {
        emit(state.copyWith(
          status: cartOperationResult.success ? CartStatus.operationSuccess : CartStatus.operationFailure,
          message: cartOperationResult.message,
          items: cartOperationResult.success ? <CartItem>[] : previousItems,
        ));
      },
    );
  }

  Future<void> removeFromCart(String productItemId) async {
    final previousItems = state.items;
    final updatedItems = previousItems
        .where((item) => item.productItemId != productItemId)
        .toList();
    emit(state.copyWith(items: updatedItems, status: CartStatus.loaded));
    final result = await _removeFromCartUseCase.call(productItemId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          items: previousItems,
          status: CartStatus.error,
          message: failure.message,
        ),
      ),
      (cartOperationResult) {
        emit(
          state.copyWith(
            status: cartOperationResult.success
                ? CartStatus.operationSuccess
                : CartStatus.operationFailure,
            message: cartOperationResult.message,
            items: cartOperationResult.success ? updatedItems : previousItems,
          ),
        );
      },
    );
  }

  Future<void> updateCartItem(String productItemId, int newQuantity) async {
    final updatedItems = state.items.map((item) {
      return item.productItemId == productItemId
          ? item.copyWith(quantity: newQuantity)
          : item;
    }).toList();
    emit(state.copyWith(items: updatedItems, status: CartStatus.loaded));
    _debounceTimers[productItemId]?.cancel();
    _debounceTimers[productItemId] = Timer(_debounceDuration, () {
      _commitQuantityUpdate(productItemId, newQuantity);
    });
  }

  Future<void> _commitQuantityUpdate(String productItemId, int quantity) async {
    final result = await _updateCartItemUseCase.call(productItemId, quantity);
    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CartStatus.error, message: failure.message),
        );
        getCartItems();
      },
      (cartOperationResult) {
        emit(
          state.copyWith(
            status: cartOperationResult.success
                ? CartStatus.operationSuccess
                : CartStatus.operationFailure,
            message: cartOperationResult.message,
          ),
        );
        if (!cartOperationResult.success) {
          getCartItems();
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
        getCartItems();
      },
    );
  }
}
