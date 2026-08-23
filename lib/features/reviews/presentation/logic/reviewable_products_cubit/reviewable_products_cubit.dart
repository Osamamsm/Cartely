import 'package:e_commerce/features/reviews/domain/entities/reviewable_product.dart';
import 'package:e_commerce/features/reviews/domain/use_cases/get_reviewable_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'reviewable_products_state.dart';

@injectable
class ReviewableProductsCubit extends Cubit<ReviewableProductsState> {
  ReviewableProductsCubit(this._getReviewableProductsUseCase)
    : super(const ReviewableProductsInitial());

  final GetReviewableProductsUseCase _getReviewableProductsUseCase;

  static const _pageSize = 10;

  Future<void> loadReviewableProducts() async {
    emit(const ReviewableProductsLoading());
    await _fetchPage(page: 1, append: false);
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! ReviewableProductsLoaded) return;
    if (!current.hasMore || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    await _fetchPage(page: current.currentPage + 1, append: true);
  }

  Future<void> _fetchPage({required int page, required bool append}) async {
    final result = await _getReviewableProductsUseCase(page: page);

    result.fold(
      (failure) {
        if (append) {
          final current = state;
          if (current is ReviewableProductsLoaded) {
            emit(current.copyWith(isLoadingMore: false));
          }
        } else {
          emit(ReviewableProductsLoadFailure(failure.message));
        }
      },
      (products) {
        final hasMore = products.length == _pageSize;
        if (append) {
          final current = state as ReviewableProductsLoaded;
          emit(
            current.copyWith(
              products: [...current.products, ...products],
              currentPage: page,
              hasMore: hasMore,
              isLoadingMore: false,
            ),
          );
        } else {
          emit(
            ReviewableProductsLoaded(
              products: products,
              currentPage: page,
              hasMore: hasMore,
            ),
          );
        }
      },
    );
  }
}
