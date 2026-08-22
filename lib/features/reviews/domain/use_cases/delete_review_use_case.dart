import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/review_operation_result.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteReviewUseCase {
  final ReviewsRepo _reviewsRepo;

  DeleteReviewUseCase(this._reviewsRepo);

  Future<Either<Failure, ReviewOperationResult>> call({
    required String reviewId,
  }) async {
    return await _reviewsRepo.deleteReview(reviewId: reviewId);
  }
}
