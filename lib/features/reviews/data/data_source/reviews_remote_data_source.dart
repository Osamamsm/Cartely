import 'package:e_commerce/features/reviews/data/models/product_review_model.dart';
import 'package:e_commerce/features/reviews/data/models/reviewable_product_model.dart';
import 'package:e_commerce/features/reviews/data/models/user_review_model.dart';

abstract class ReviewsRemoteDataSource {
  Future<void> addReview({
    required String productId,
    required String comment,
    required double rating,
  });

  Future<void> editReview({
    required String reviewId,
    required String comment,
    required double rating,
  });

  Future<void> deleteReview({required String reviewId});

  Future<List<UserReviewModel>> getUserReviews({
    required int page,
  });

  Future<List<ProductReviewModel>> getProductReviews({
    required String productId,
    double? ratingFilter,
    required int page,
  });

  Future<List<ReviewableProductModel>> getReviewableProducts({
    required int page,
  });
}

