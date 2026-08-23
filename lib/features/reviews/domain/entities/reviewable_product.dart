import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ReviewableProduct extends Equatable {
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

  const ReviewableProduct({
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

  String localizedProductName(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return languageCode == 'ar' ? productNameAr : productNameEn;
  }

  String? localizedVariation(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return languageCode == 'ar' ? variationAr : variationEn;
  }

  factory ReviewableProduct.placeholder() => ReviewableProduct(
    orderLineId: 'orderLineId',
    orderId: 'orderId',
    orderNumber: 'orderNumber',
    productId: 'productId',
    productNameEn: 'productNameEn',
    productNameAr: 'productNameAr',
    productImageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    variationEn: 'variationEn',
    variationAr: 'variationAr',
    quantity: 1,
    price: 1,
    purchasedAt: DateTime.now(),
  );

  @override
  List<Object?> get props => [
    orderLineId,
    orderId,
    orderNumber,
    productId,
    productNameEn,
    productNameAr,
    productImageUrl,
    variationEn,
    variationAr,
    quantity,
    price,
    purchasedAt,
  ];
}
