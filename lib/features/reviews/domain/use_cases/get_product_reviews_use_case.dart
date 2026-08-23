import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductReviewsUseCase {
  final ReviewsRepo _reviewsRepo;

  GetProductReviewsUseCase(this._reviewsRepo);

  Future<Either<Failure, List<ProductReview>>> call({
    required String productId,
    required int page,
    double? ratingFilter,
  }) async {
    return await _reviewsRepo.getProductReviews(
      productId: productId,
      page: page,
      ratingFilter: ratingFilter,
    );
  }
}
