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
  final bool isFiltering;
  final double? selectedRating;

  const ProductReviewsLoaded({
    required this.reviews,
    required this.currentPage,
    required this.hasMore,
    this.isLoadingMore = false,
    this.isFiltering = false,
    this.selectedRating,
  });

  ProductReviewsLoaded copyWith({
    List<ProductReview>? reviews,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
    bool? isFiltering,
    double? selectedRating,
    bool clearSelectedRating = false,
  }) {
    return ProductReviewsLoaded(
      reviews: reviews ?? this.reviews,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isFiltering: isFiltering ?? this.isFiltering,
      selectedRating: clearSelectedRating
          ? null
          : (selectedRating ?? this.selectedRating),
    );
  }

  @override
  List<Object?> get props => [
        reviews,
        currentPage,
        hasMore,
        isLoadingMore,
        isFiltering,
        selectedRating,
      ];
}

final class ProductReviewsActionResult extends ProductReviewsLoaded {
  final String message;
  final bool isError;

  const ProductReviewsActionResult({
    required this.message,
    required this.isError,
    required super.reviews,
    required super.currentPage,
    required super.hasMore,
    super.isLoadingMore,
    super.isFiltering,
    super.selectedRating,
  });

  @override
  List<Object?> get props => [...super.props, message, isError];
}