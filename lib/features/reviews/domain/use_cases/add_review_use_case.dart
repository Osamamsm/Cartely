import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/review_operation_result.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddReviewUseCase {
  final ReviewsRepo _reviewsRepo;

  AddReviewUseCase(this._reviewsRepo);

  Future<Either<Failure, ReviewOperationResult>> call({
    required String productId,
    required String comment,
    required double rating,
  }) async {
    return await _reviewsRepo.addReview(
      productId: productId,
      comment: comment,
      rating: rating,
    );
  }
}
