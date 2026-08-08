import 'package:e_commerce/features/addresses/data/models/address_model.dart';
import 'package:e_commerce/features/orders/data/model/order_line_model.dart';
import 'package:e_commerce/features/orders/domain/entity/order_details.dart';

class OrderDetailsModel {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final double subtotal;
  final double shipping;
  final double total;
  final double discountAmount;
  final String orderStatus;
  final String paymentStatus;
  final AddressModel address;
  final List<OrderLineModel> items;

  const OrderDetailsModel({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.discountAmount,
    required this.orderStatus,
    required this.paymentStatus,
    required this.address,
    required this.items,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      subtotal: (json['subtotal'] as num).toDouble(),
      shipping: (json['shipping'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num).toDouble(),
      orderStatus: json['order_status'] as String,
      paymentStatus: json['payment_status'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderLineModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  OrderDetails toEntity() {
    return OrderDetails(
      orderId: orderId,
      orderNumber: orderNumber,
      createdAt: createdAt,
      subtotal: subtotal,
      shipping: shipping,
      total: total,
      discountAmount: discountAmount,
      orderStatus: orderStatus,
      paymentStatus: paymentStatus,
      address: address.toEntity(),
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}
