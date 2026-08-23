import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserReview extends Equatable {
  final String id;
  final String orderLineId;
  final String productId;
  final String productNameEn;
  final String productNameAr;
  final String? productImageUrl;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UserReview({
    required this.id,
    required this.orderLineId,
    required this.productId,
    required this.productNameEn,
    required this.productNameAr,
    required this.productImageUrl,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isEdited => updatedAt != null;

  String localizedProductName(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return languageCode == 'ar' ? productNameAr : productNameEn;
  }

  factory UserReview.placeholder() {
    return UserReview(
      id: 'placeholder',
      orderLineId: 'placeholder',
      productId: 'placeholder',
      productNameEn: 'placeholder',
      productNameAr: 'placeholder',
      productImageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      rating: 0,
      comment: '',
      createdAt: DateTime.now(),
      updatedAt: null,
    );
  }

  @override
  List<Object?> get props => [
    id,
    orderLineId,
    productId,
    productNameEn,
    productNameAr,
    productImageUrl,
    rating,
    comment,
    createdAt,
    updatedAt,
  ];
}
