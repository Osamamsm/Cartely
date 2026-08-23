import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/reviews/presentation/logic/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/filter_chips_header_delegate.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/open_review_sheet.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/product_reviews_list.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/reviews_summary_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReviewsTab extends StatelessWidget {
  const ProductReviewsTab({
    super.key,
    required this.productId,
    required this.avgRating,
    required this.reviewsCount,
  });

  final String productId;
  final double avgRating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<ProductReviewsCubit, ProductReviewsState>(
      listener: (context, state) {
        if (state is ProductReviewsActionResult) {
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
        if (state is ProductReviewsInitial || state is ProductReviewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductReviewsLoadFailure) {
          return Center(
            child: Text(
              state.message,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          );
        }

        final loaded = state as ProductReviewsLoaded;

        return CustomScrollView(
          slivers: [
            ReviewsSummaryHeader(
              avgRating: avgRating,
              reviewsCount: reviewsCount,
              onWriteReview: () => openProductReviewSheet(
                context: context,
                isEdit: false,
                productId: productId,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: FilterChipsHeaderDelegate(
                onSelect: (rating) =>
                    context.read<ProductReviewsCubit>().filterByRating(rating),
                backgroundColor: theme.scaffoldBackgroundColor,
              ),
            ),
            ProductReviewsList(reviews: loaded.reviews),
            SliverToBoxAdapter(
              child: loaded.isLoadingMore
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : vGap(20),
            ),
          ],
        );
      },
    );
  }
}
