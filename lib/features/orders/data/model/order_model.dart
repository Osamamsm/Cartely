import 'package:e_commerce/features/orders/domain/entity/order.dart';

class OrderModel {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final double subtotal;
  final double shipping;
  final double total;
  final String orderStatus;
  final String paymentStatus;
  final int itemCount;
  final String? thumbnailUrl;

  const OrderModel({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.orderStatus,
    required this.paymentStatus,
    required this.itemCount,
    this.thumbnailUrl,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      subtotal: (json['subtotal'] as num).toDouble(),
      shipping: (json['shipping'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      orderStatus: json['order_status'] as String,
      paymentStatus: json['payment_status'] as String,
      itemCount: (json['item_count'] as num).toInt(),
      thumbnailUrl: json['thumbnail_url'] as String?,
    );
  }

  Order toEntity() {
    return Order(
      orderId: orderId,
      orderNumber: orderNumber,
      createdAt: createdAt,
      subtotal: subtotal,
      shipping: shipping,
      total: total,
      orderStatus: OrderStatus.values.firstWhere((v) => v.name == orderStatus),
      paymentStatus: paymentStatus,
      itemCount: itemCount,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
