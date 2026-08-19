import 'package:e_commerce/features/orders/domain/entity/order_line.dart';

class OrderLineModel {
  final String orderLineId;
  final String productItemId;
  final String productName;
  final int quantity;
  final double price;
  final String? imageUrl;
  final String? variation;

  const OrderLineModel({
    required this.orderLineId,
    required this.productItemId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
    this.variation,
  });

  factory OrderLineModel.fromJson(Map<String, dynamic> json) {
    return OrderLineModel(
      orderLineId: json['order_line_id'].toString(),
      productItemId: json['product_item_id'].toString(),
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String?,
      variation: json['variation'] as String?,
    );
  }

  OrderLine toEntity() {
    return OrderLine(
      orderLineId: orderLineId,
      productItemId: productItemId,
      productName: productName,
      quantity: quantity,
      price: price,
      imageUrl: imageUrl,
      variation: variation,
    );
  }
}