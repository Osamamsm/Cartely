import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final CartStatus
  status; // initial, loading, loaded, operationSuccess, operationFailure, error
  final String? message;

  CartState({required this.items, required this.status, this.message});

  CartState copyWith({
    List<CartItem>? items,
    CartStatus? status,
    String? message,
  }) {
    return CartState(
      items: items ?? this.items,
      status: status ?? this.status,
      message: message,
    );
  }
}

enum CartStatus {
  initial,
  loading,
  loaded,
  operationSuccess,
  operationFailure,
  error,
}
