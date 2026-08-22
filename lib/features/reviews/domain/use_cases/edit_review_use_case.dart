import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/review_operation_result.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditReviewUseCase {
  final ReviewsRepo _reviewsRepo;

  EditReviewUseCase(this._reviewsRepo);

  Future<Either<Failure, ReviewOperationResult>> call({
    required String reviewId,
    required String comment,
    required double rating,
  }) async {
    return await _reviewsRepo.editReview(
      reviewId: reviewId,
      comment: comment,
      rating: rating,
    );
  }
}
