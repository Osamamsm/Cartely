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
