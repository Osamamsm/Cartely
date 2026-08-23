import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';
import 'package:e_commerce/features/reviews/domain/entities/review_operation_result.dart';
import 'package:e_commerce/features/reviews/domain/entities/reviewable_product.dart';
import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';

abstract class ReviewsRepo {
  Future<Either<Failure, ReviewOperationResult>> addReview({
    required String productId,
    required String comment,
    required double rating,
  });

  Future<Either<Failure, ReviewOperationResult>> editReview({
    required String reviewId,
    required String comment,
    required double rating,
  });

  Future<Either<Failure, ReviewOperationResult>> deleteReview({
    required String reviewId,
  });

  Future<Either<Failure, List<ProductReview>>> getProductReviews({
    required String productId,
    required int page,
    double? ratingFilter,
  });

  Future<Either<Failure, List<UserReview>>> getUserReviews({required int page});

  Future<Either<Failure, List<ReviewableProduct>>> getReviewableProducts({
    required int page,
  });
}
