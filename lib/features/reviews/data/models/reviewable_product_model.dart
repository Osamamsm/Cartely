import 'package:e_commerce/features/reviews/domain/entities/reviewable_product.dart';

class ReviewableProductModel {
  final String orderLineId;
  final String orderId;
  final String orderNumber;
  final String productId;
  final String productNameEn;
  final String productNameAr;
  final String? productImageUrl;
  final String? variationEn;
  final String? variationAr;
  final int quantity;
  final double price;
  final DateTime purchasedAt;

  ReviewableProductModel({
    required this.orderLineId,
    required this.orderId,
    required this.orderNumber,
    required this.productId,
    required this.productNameEn,
    required this.productNameAr,
    required this.productImageUrl,
    required this.variationEn,
    required this.variationAr,
    required this.quantity,
    required this.price,
    required this.purchasedAt,
  });

  factory ReviewableProductModel.fromJson(Map<String, dynamic> json) {
    return ReviewableProductModel(
      orderLineId: json['order_line_id'] as String,
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      productId: json['product_id'] as String,
      productNameEn: json['product_name_en'] as String,
      productNameAr: json['product_name_ar'] as String,
      productImageUrl: json['product_image_url'] as String?,
      variationEn: json['variation_en'] as String?,
      variationAr: json['variation_ar'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      purchasedAt: DateTime.parse(json['purchased_at'] as String),
    );
  }

  ReviewableProduct toEntity() {
    return ReviewableProduct(
      orderLineId: orderLineId,
      orderId: orderId,
      orderNumber: orderNumber,
      productId: productId,
      productNameEn: productNameEn,
      productNameAr: productNameAr,
      productImageUrl: productImageUrl,
      variationEn: variationEn,
      variationAr: variationAr,
      quantity: quantity,
      price: price,
      purchasedAt: purchasedAt,
    );
  }
}
