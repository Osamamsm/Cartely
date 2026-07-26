import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

enum CartStatus { initial, loading, loaded, operationSuccess, operationFailure, error }

class CartState extends Equatable {
  final Cart cart;
  final CartStatus status;
  final String? message;

  const CartState({required this.cart, required this.status, this.message});

  factory CartState.initial() =>
      CartState(cart: Cart.empty(), status: CartStatus.initial);

  List<CartItem> get items => cart.items;

  CartState copyWith({
    Cart? cart,
    CartStatus? status,
    String? message,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      status: status ?? this.status,
      message: message,
    );
  }

  @override
  List<Object?> get props => [cart, status, message];
}