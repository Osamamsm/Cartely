part of 'user_reviews_cubit.dart';

sealed class UserReviewsState extends Equatable {
  const UserReviewsState();

  @override
  List<Object?> get props => [];
}

final class UserReviewsInitial extends UserReviewsState {
  const UserReviewsInitial();
}

final class UserReviewsLoading extends UserReviewsState {
  const UserReviewsLoading();
}

final class UserReviewsLoadFailure extends UserReviewsState {
  final String message;

  const UserReviewsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

base class UserReviewsLoaded extends UserReviewsState {
  final List<UserReview> reviews;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const UserReviewsLoaded({
    required this.reviews,
    required this.currentPage,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  UserReviewsLoaded copyWith({
    List<UserReview>? reviews,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return UserReviewsLoaded(
      reviews: reviews ?? this.reviews,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [reviews, currentPage, hasMore, isLoadingMore];
}

final class UserReviewsActionResult extends UserReviewsLoaded {
  final String message;
  final bool isError;

 const UserReviewsActionResult({
    required this.message,
    required this.isError,
    required super.reviews,
    required super.currentPage,
    required super.hasMore,
    super.isLoadingMore,
  });

  @override
  List<Object?> get props => [...super.props, message, isError];
}