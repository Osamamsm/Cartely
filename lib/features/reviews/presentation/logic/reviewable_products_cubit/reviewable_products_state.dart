part of 'reviewable_products_cubit.dart';

sealed class ReviewableProductsState extends Equatable {
  const ReviewableProductsState();

  @override
  List<Object?> get props => [];
}

final class ReviewableProductsInitial extends ReviewableProductsState {
  const ReviewableProductsInitial();
}

final class ReviewableProductsLoading extends ReviewableProductsState {
  const ReviewableProductsLoading();
}

final class ReviewableProductsLoadFailure extends ReviewableProductsState {
  final String message;

  const ReviewableProductsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

final class ReviewableProductsLoaded extends ReviewableProductsState {
  final List<ReviewableProduct> products;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const ReviewableProductsLoaded({
    required this.products,
    required this.currentPage,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  ReviewableProductsLoaded copyWith({
    List<ReviewableProduct>? products,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return ReviewableProductsLoaded(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [products, currentPage, hasMore, isLoadingMore];
}
