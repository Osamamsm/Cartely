import 'package:equatable/equatable.dart';

sealed class PlaceOrderResult extends Equatable {
  const PlaceOrderResult();
}

class PlacedOrder extends PlaceOrderResult {
  final String orderId;
  final String orderNumber;
  final double total;
  final String? checkoutUrl;

  const PlacedOrder({
    required this.orderId,
    required this.orderNumber,
    required this.total,
    this.checkoutUrl
  });

  @override
  List<Object?> get props => [orderId, orderNumber, total];
}

class PlaceOrderRejected extends PlaceOrderResult {
  final String message;

  const PlaceOrderRejected({required this.message});

  @override
  List<Object?> get props => [message];
}