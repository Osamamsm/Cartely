import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/reviewable_product.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetReviewableProductsUseCase {
  final ReviewsRepo _reviewsRepo;

  GetReviewableProductsUseCase(this._reviewsRepo);

  Future<Either<Failure, List<ReviewableProduct>>> call({
    required int page,
  }) async {
    return await _reviewsRepo.getReviewableProducts(page: page);
  }
}
