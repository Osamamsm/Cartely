import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';
import 'package:e_commerce/features/reviews/domain/entities/review_operation_result.dart';
import 'package:e_commerce/features/reviews/domain/entities/reviewable_product.dart';
import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';
import 'package:e_commerce/features/reviews/data/data_source/reviews_remote_data_source.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReviewsRepo)
class ReviewsRepoImpl implements ReviewsRepo {
  final ReviewsRemoteDataSource _reviewsRemoteDataSource;

  ReviewsRepoImpl(this._reviewsRemoteDataSource);
  @override
  Future<Either<Failure, ReviewOperationResult>> addReview({
    required String productId,
    required String comment,
    required double rating,
  }) async {
    try {
      final result = await _reviewsRemoteDataSource.addReview(
        productId: productId,
        comment: comment,
        rating: rating,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ReviewOperationResult>> deleteReview({
    required String reviewId,
  }) async {
    try {
      final result = await _reviewsRemoteDataSource.deleteReview(
        reviewId: reviewId,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ReviewOperationResult>> editReview({
    required String reviewId,
    required String comment,
    required double rating,
  }) async {
    try {
      final result = await _reviewsRemoteDataSource.editReview(
        reviewId: reviewId,
        comment: comment,
        rating: rating,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductReview>>> getProductReviews({
    required String productId,
    required int page,
    double? ratingFilter,
  }) async {
    try {
      final result = await _reviewsRemoteDataSource.getProductReviews(
        productId: productId,
        page: page,
        ratingFilter: ratingFilter,
      );
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<ReviewableProduct>>> getReviewableProducts({
    required int page,
  }) async {
    try {
      final result = await _reviewsRemoteDataSource.getReviewableProducts(
        page: page,
      );
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<UserReview>>> getUserReviews({
    required int page,
  }) async {
    try {
      final result = await _reviewsRemoteDataSource.getUserReviews(page: page);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
