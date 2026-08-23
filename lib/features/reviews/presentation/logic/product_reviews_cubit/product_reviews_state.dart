part of 'product_reviews_cubit.dart';

sealed class ProductReviewsState extends Equatable {
  const ProductReviewsState();

  @override
  List<Object?> get props => [];
}

final class ProductReviewsInitial extends ProductReviewsState {
  const ProductReviewsInitial();
}

final class ProductReviewsLoading extends ProductReviewsState {
  const ProductReviewsLoading();
}

final class ProductReviewsLoadFailure extends ProductReviewsState {
  final String message;

  const ProductReviewsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

base class ProductReviewsLoaded extends ProductReviewsState {
  final List<ProductReview> reviews;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const ProductReviewsLoaded({
    required this.reviews,
    required this.currentPage,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  ProductReviewsLoaded copyWith({
    List<ProductReview>? reviews,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return ProductReviewsLoaded(
      reviews: reviews ?? this.reviews,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [reviews, currentPage, hasMore, isLoadingMore];
}

final class ProductReviewsActionFailed extends ProductReviewsLoaded {
  final String message;
  final bool isException;

  const ProductReviewsActionFailed({
    required this.message,
    required this.isException,
    required super.reviews,
    required super.currentPage,
    required super.hasMore,
    super.isLoadingMore,
  });

  @override
  List<Object?> get props => [...super.props, message, isException];
}

final class ProductReviewsAddSucceeded extends ProductReviewsLoaded {
  final String productId;

  const ProductReviewsAddSucceeded({
    required this.productId,
    required super.reviews,
    required super.currentPage,
    required super.hasMore,
    super.isLoadingMore,
  });

  @override
  List<Object?> get props => [...super.props, productId];
}
