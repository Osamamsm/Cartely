import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';

class UserReviewModel {
  final String reviewId;
  final String orderLineId;
  final String productId;
  final String productNameEn;
  final String productNameAr;
  final String? productImageUrl;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final DateTime? updatedAt;

  UserReviewModel({
    required this.reviewId,
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

  factory UserReviewModel.fromJson(Map<String, dynamic> json) {
    return UserReviewModel(
      reviewId: json['review_id'] as String,
      orderLineId: json['order_line_id'] as String,
      productId: json['product_id'] as String,
      productNameEn: json['product_name_en'] as String,
      productNameAr: json['product_name_ar'] as String,
      productImageUrl: json['product_image_url'] as String?,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }

  UserReview toEntity() {
    return UserReview(
      id: reviewId,
      orderLineId: orderLineId,
      productId: productId,
      productNameEn: productNameEn,
      productNameAr: productNameAr,
      productImageUrl: productImageUrl,
      rating: rating,
      comment: comment,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
