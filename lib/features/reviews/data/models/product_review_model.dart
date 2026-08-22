import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';

class ProductReviewModel {
  final String reviewId;
  final String userId;
  final String userFullName;
  final String? userAvatarUrl;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProductReviewModel({
    required this.reviewId,
    required this.userId,
    required this.userFullName,
    required this.userAvatarUrl,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      reviewId: json['review_id'] as String,
      userId: json['user_id'] as String,
      userFullName: json['user_full_name'] as String,
      userAvatarUrl: json['user_avatar_url'] as String?,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }

  ProductReview toEntity() {
    return ProductReview(
      id: reviewId,
      userId: userId,
      userFullName: userFullName,
      userAvatarUrl: userAvatarUrl,
      rating: rating,
      comment: comment,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
