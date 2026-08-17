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
  final double total;

  PlacedOrderModel({
    required this.orderId,
    required this.orderNumber,
    required this.total,
  });

  factory PlacedOrderModel.fromJson(Map<String, dynamic> json) =>
      PlacedOrderModel(
        orderId: json['order_id'] as String,
        orderNumber: json['order_number'] as String,
        total: (json['total'] as num).toDouble(),
      );

  @override
  PlacedOrder toEntity() => PlacedOrder(
    orderId: orderId,
    orderNumber: orderNumber,
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
