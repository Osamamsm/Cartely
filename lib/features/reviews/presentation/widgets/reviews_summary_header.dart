import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ReviewsSummaryHeader extends StatelessWidget {
  const ReviewsSummaryHeader({
    super.key,
    required this.avgRating,
    required this.reviewsCount,
    required this.onWriteReview,
  });

  final double avgRating;
  final int reviewsCount;
  final VoidCallback onWriteReview;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      sliver: SliverToBoxAdapter(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  avgRating.toStringAsFixed(1),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: List.generate(5, (i) {
                    final filled = i < avgRating.round();
                    return Icon(
                      filled ? Icons.star_rounded : Icons.star_border_rounded,
                      size: 18,
                      color: theme.colorScheme.primary,
                    );
                  }),
                ),
                vGap(4),
                Text(
                  S.of(context).review(reviewsCount),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: onWriteReview,
              icon: const Icon(Icons.rate_review_outlined, size: 18),
              label: Text(S.of(context).add_review),
            ),
          ],
        ),
      ),
    );
  }
}
