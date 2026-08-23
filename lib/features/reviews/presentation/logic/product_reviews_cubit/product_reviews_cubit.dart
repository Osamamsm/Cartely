import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/add_review_use_case.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/delete_review_use_case.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/edit_review_use_case.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/get_product_reviews_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'product_reviews_state.dart';

@injectable
class ProductReviewsCubit extends Cubit<ProductReviewsState> {
  ProductReviewsCubit(
    this._getProductReviewsUseCase,
    this._addReviewUseCase,
    this._editReviewUseCase,
    this._deleteReviewUseCase,
  ) : super(const ProductReviewsInitial());

  final GetProductReviewsUseCase _getProductReviewsUseCase;
  final AddReviewUseCase _addReviewUseCase;
  final EditReviewUseCase _editReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  static const _pageSize = 10;

  String? _productId;
  double? _ratingFilter;

  Future<void> loadReviews(String productId) async {
    _productId = productId;
    emit(const ProductReviewsLoading());
    await _fetchPage(page: 1, append: false);
  }

  Future<void> filterByRating({required double rating}) async {
    if (_productId == null) return;
    _ratingFilter = rating;
    emit(const ProductReviewsLoading());
    await _fetchPage(page: 1, append: false);
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! ProductReviewsLoaded) return;
    if (!current.hasMore || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    await _fetchPage(page: current.currentPage + 1, append: true);
  }

  Future<void> _fetchPage({required int page, required bool append}) async {
    final result = await _getProductReviewsUseCase.call(
      productId: _productId!,
      page: page,
      ratingFilter: _ratingFilter,
    );

    result.fold(
      (failure) {
        if (append) {
          final current = state;
          if (current is ProductReviewsLoaded) {
            emit(current.copyWith(isLoadingMore: false));
          }
        } else {
          emit(ProductReviewsLoadFailure(failure.message));
        }
      },
      (reviews) {
        final hasMore = reviews.length == _pageSize;
        if (append) {
          final current = state as ProductReviewsLoaded;
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
            ProductReviewsLoaded(
              reviews: reviews,
              currentPage: page,
              hasMore: hasMore,
            ),
          );
        }
      },
    );
  }

  Future<void> addReview({
    required String productId,
    required String comment,
    required double rating,
  }) async {
    final current = state;
    if (current is! ProductReviewsLoaded) return;

    final result = await _addReviewUseCase.call(
      productId: productId,
      comment: comment,
      rating: rating,
    );

    result.fold(
      (failure) => emit(
        ProductReviewsActionFailed(
          message: failure.message,
          isException: true,
          reviews: current.reviews,
          currentPage: current.currentPage,
          hasMore: current.hasMore,
        ),
      ),
      (operationResult) {
        if (operationResult.success) {
          emit(
            ProductReviewsAddSucceeded(
              productId: productId,
              reviews: current.reviews,
              currentPage: current.currentPage,
              hasMore: current.hasMore,
            ),
          );
          _fetchPage(page: 1, append: false);
        } else {
          emit(
            ProductReviewsActionFailed(
              message: operationResult.message,
              isException: false,
              reviews: current.reviews,
              currentPage: current.currentPage,
              hasMore: current.hasMore,
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
    if (current is! ProductReviewsLoaded) return;

    final index = current.reviews.indexWhere((r) => r.id == reviewId);
    if (index == -1) return;

    final rollbackReviews = current.reviews;
    final rollbackPage = current.currentPage;
    final rollbackHasMore = current.hasMore;

    final previous = current.reviews[index];
    final optimistic = ProductReview(
      id: previous.id,
      userId: previous.userId,
      userFullName: previous.userFullName,
      userAvatarUrl: previous.userAvatarUrl,
      rating: rating,
      comment: comment,
      createdAt: previous.createdAt,
      updatedAt: DateTime.now(),
    );

    final optimisticList = [...current.reviews];
    optimisticList[index] = optimistic;
    emit(current.copyWith(reviews: optimisticList));

    final result = await _editReviewUseCase.call(
      reviewId: reviewId,
      comment: comment,
      rating: rating,
    );

    result.fold(
      (failure) => emit(
        ProductReviewsActionFailed(
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
            ProductReviewsActionFailed(
              message: operationResult.message,
              isException: false,
              reviews: rollbackReviews,
              currentPage: rollbackPage,
              hasMore: rollbackHasMore,
            ),
          );
        }
        // success: optimistic list already reflects the change, nothing more to do.
      },
    );
  }

  Future<void> deleteReview(String reviewId) async {
    final current = state;
    if (current is! ProductReviewsLoaded) return;

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
        ProductReviewsActionFailed(
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
            ProductReviewsActionFailed(
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
