import 'package:e_commerce/core/widgets/empty_body.dart';
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
      return SliverToBoxAdapter(
        child: EmptyBody(
          icon: Icons.rate_review_outlined,
          title: S.of(context).no_reviews,
          message: S.of(context).no_reviews_description,
        ),
      );
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
