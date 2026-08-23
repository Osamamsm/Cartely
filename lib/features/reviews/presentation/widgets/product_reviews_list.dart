import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/review_card.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductReviewsList extends StatelessWidget {
  const ProductReviewsList({super.key, required this.reviews});

  final List<ProductReview> reviews;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (reviews.isEmpty) {
      return const _ProductReviewsEmptyBody();
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.separated(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewCard(review: reviews[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(color: theme.colorScheme.outline, height: 20);
        },
      ),
    );
  }
}

class _ProductReviewsEmptyBody extends StatelessWidget {
  const _ProductReviewsEmptyBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            S.of(context).no_reviews_yet,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}