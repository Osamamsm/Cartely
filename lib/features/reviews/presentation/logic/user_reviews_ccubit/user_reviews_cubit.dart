import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/delete_review_use_case.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/edit_review_use_case.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/get_user_reviews_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'user_reviews_state.dart';

@injectable
class UserReviewsCubit extends Cubit<UserReviewsState> {
  UserReviewsCubit(
    this._getUserReviewsUseCase,
    this._editReviewUseCase,
    this._deleteReviewUseCase,
  ) : super(const UserReviewsInitial());

  final GetUserReviewsUseCase _getUserReviewsUseCase;
  final EditReviewUseCase _editReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  static const _pageSize = 10;

  Future<void> loadMyReviews() async {
    emit(const UserReviewsLoading());
    await _fetchPage(page: 1, append: false);
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! UserReviewsLoaded) return;
    if (!current.hasMore || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    await _fetchPage(page: current.currentPage + 1, append: true);
  }

  Future<void> _fetchPage({required int page, required bool append}) async {
    final result = await _getUserReviewsUseCase(page: page);

    result.fold(
      (failure) {
        if (append) {
          final current = state;
          if (current is UserReviewsLoaded) {
            emit(current.copyWith(isLoadingMore: false));
          }
        } else {
          emit(UserReviewsLoadFailure(failure.message));
        }
      },
      (reviews) {
        final hasMore = reviews.length == _pageSize;
        if (append) {
          final current = state as UserReviewsLoaded;
          emit(
            current.copyWith(
              reviews: [...current.reviews, ...reviews],
              currentPage: page,
              hasMore: hasMore,
              isLoadingMore: false,
            ),
          );
        } else {
          emit(
            UserReviewsLoaded(
              reviews: reviews,
              currentPage: page,
              hasMore: hasMore,
            ),
          );
        }
      },
    );
  }

  Future<void> editReview({
    required String reviewId,
    required String comment,
    required double rating,
  }) async {
    final current = state;
    if (current is! UserReviewsLoaded) return;

    final index = current.reviews.indexWhere((r) => r.id == reviewId);
    if (index == -1) return;

    final rollbackReviews = current.reviews;
    final rollbackPage = current.currentPage;
    final rollbackHasMore = current.hasMore;

    final previous = current.reviews[index];
    final optimistic = UserReview(
      id: previous.id,
      orderLineId: previous.orderLineId,
      productId: previous.productId,
      productNameEn: previous.productNameEn,
      productNameAr: previous.productNameAr,
      productImageUrl: previous.productImageUrl,
      rating: rating,
      comment: comment,
      createdAt: previous.createdAt,
      updatedAt: DateTime.now(),
    );

    final optimisticList = [...current.reviews];
    optimisticList[index] = optimistic;
    emit(current.copyWith(reviews: optimisticList));

    final result = await _editReviewUseCase(
      reviewId: reviewId,
      comment: comment,
      rating: rating,
    );

    result.fold(
      (failure) => emit(
        UserReviewsActionFailed(
          message: failure.message,
          isException: true,
          reviews: rollbackReviews,
          currentPage: rollbackPage,
          hasMore: rollbackHasMore,
        ),
      ),
      (operationResult) {
        if (!operationResult.success) {
          emit(
            UserReviewsActionFailed(
              message: operationResult.message,
              isException: false,
              reviews: rollbackReviews,
              currentPage: rollbackPage,
              hasMore: rollbackHasMore,
            ),
          );
        }
      },
    );
  }

  Future<void> deleteReview(String reviewId) async {
    final current = state;
    if (current is! UserReviewsLoaded) return;

    final index = current.reviews.indexWhere((r) => r.id == reviewId);
    if (index == -1) return;

    final rollbackReviews = current.reviews;
    final rollbackPage = current.currentPage;
    final rollbackHasMore = current.hasMore;

    final optimisticList = [...current.reviews]..removeAt(index);
    emit(current.copyWith(reviews: optimisticList));

    final result = await _deleteReviewUseCase(reviewId: reviewId);

    result.fold(
      (failure) => emit(
        UserReviewsActionFailed(
          message: failure.message,
          isException: true,
          reviews: rollbackReviews,
          currentPage: rollbackPage,
          hasMore: rollbackHasMore,
        ),
      ),
      (operationResult) {
        if (!operationResult.success) {
          emit(
            UserReviewsActionFailed(
              message: operationResult.message,
              isException: false,
              reviews: rollbackReviews,
              currentPage: rollbackPage,
              hasMore: rollbackHasMore,
            ),
          );
        }
      },
    );
  }
}
