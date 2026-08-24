import 'package:e_commerce/core/widgets/empty_body.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';
import 'package:e_commerce/features/reviews/presentation/logic/user_reviews_ccubit/user_reviews_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/pending_reviews_banner.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/user_review_card.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyReviewsViewBody extends StatelessWidget {
  const MyReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<UserReviewsCubit, UserReviewsState>(
      listener: (context, state) {
        if (state is UserReviewsActionResult) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message), 
                backgroundColor: state.isError
                    ? theme.colorScheme.error
                    : Colors.green,
              ),
            );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const PendingReviewsBanner(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () =>
                    context.read<UserReviewsCubit>().loadMyReviews(),
                child: BlocBuilder<UserReviewsCubit, UserReviewsState>(
                  builder: (context, state) {
                    switch (state) {
                      case UserReviewsInitial():
                      case UserReviewsLoading():
                        return Skeletonizer(
                          enabled: true,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            itemCount: 4,
                            itemBuilder: (_, __) => UserReviewCard(
                              review: UserReview.placeholder(),
                            ),
                          ),
                        );
                      case UserReviewsLoadFailure(:final message):
                        return ErrorBody(
                          errMessage: message,
                          onRetry: () =>
                              context.read<UserReviewsCubit>().loadMyReviews(),
                          goHomeEnabled: false,
                        );

                      case UserReviewsLoaded(
                        :final reviews,
                        :final isLoadingMore,
                      ):
                        if (reviews.isEmpty) {
                          return EmptyBody(
                            icon: Icons.rate_review_outlined,
                            title: S.of(context).no_reviews,
                            message: S.of(context).no_reviews_description,
                          );
                        }
                        return _LoadedUserReviewsList(reviews: reviews, isLoadingMore: isLoadingMore);
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoadedUserReviewsList extends StatelessWidget {
  const _LoadedUserReviewsList({
    required this.reviews,
    required this.isLoadingMore,
  });

  final List<UserReview> reviews;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent -
                    200) {
          context.read<UserReviewsCubit>().loadMore();
        }
        return false;
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: reviews.length + (isLoadingMore ? 1 : 0),
        separatorBuilder: (_, __) =>
            const Divider(height: 1),
        itemBuilder: (context, index) {
          if (index >= reviews.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                  ),
                ),
              ),
            );
          }
          return UserReviewCard(review: reviews[index]);
        },
      ),
    );
  }
}
