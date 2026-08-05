import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';

sealed class PlaceOrderResultModel {
  factory PlaceOrderResultModel.fromJson(Map<String, dynamic> json) {
    final success = json['success'] as bool;
    return success
        ? PlacedOrderModel.fromJson(json)
        : PlaceOrderRejectedModel.fromJson(json);
  }

  PlaceOrderResult toEntity();
}

class PlacedOrderModel implements PlaceOrderResultModel {
  final String orderId;
  final String orderNumber;
  final double subtotal;
  final double shipping;
  final double total;

  PlacedOrderModel({
    required this.orderId,
    required this.orderNumber,
    required this.subtotal,
    required this.shipping,
    required this.total,
  });

  factory PlacedOrderModel.fromJson(Map<String, dynamic> json) =>
      PlacedOrderModel(
        orderId: json['order_id'] as String,
        orderNumber: json['order_number'] as String,
        subtotal: (json['subtotal'] as num).toDouble(),
        shipping: (json['shipping'] as num).toDouble(),
        total: (json['total'] as num).toDouble(),
      );

  @override
  PlacedOrder toEntity() => PlacedOrder(
    orderId: orderId,
    orderNumber: orderNumber,
    subtotal: subtotal,
    shipping: shipping,
    total: total,
  );
}

class PlaceOrderRejectedModel implements PlaceOrderResultModel {
  final String message;

  PlaceOrderRejectedModel({required this.message});

  factory PlaceOrderRejectedModel.fromJson(Map<String, dynamic> json) =>
      PlaceOrderRejectedModel(message: json['message'] as String);

  @override
  PlaceOrderResult toEntity() => PlaceOrderRejected(message: message);
}
