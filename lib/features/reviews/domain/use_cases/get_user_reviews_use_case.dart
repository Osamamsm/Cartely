import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';
import 'package:e_commerce/features/reviews/domain/repo/reviews_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserReviewsUseCase {
  final ReviewsRepo _reviewsRepo;

  GetUserReviewsUseCase(this._reviewsRepo);

  Future<Either<Failure, List<UserReview>>> call({required int page}) async {
    return await _reviewsRepo.getUserReviews(page: page);
  }
}
