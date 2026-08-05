import 'package:equatable/equatable.dart';

sealed class PlaceOrderResult extends Equatable {
  const PlaceOrderResult();
}

class PlacedOrder extends PlaceOrderResult {
  final String orderId;
  final String orderNumber;
  final double subtotal;
  final double shipping;
  final double total;

  const PlacedOrder({
    required this.orderId,
    required this.orderNumber,
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  @override
  List<Object?> get props => [orderId, orderNumber, subtotal, shipping, total];
}

class PlaceOrderRejected extends PlaceOrderResult {
  final String message;

  const PlaceOrderRejected({required this.message});

  @override
  List<Object?> get props => [message];
}