import 'package:e_commerce/features/reviews/presentation/logic/reviewable_products_cubit/reviewable_products_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/views/rate_your_purchases_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PendingReviewsBanner extends StatelessWidget {
  const PendingReviewsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewableProductsCubit, ReviewableProductsState>(
      builder: (context, state) {
        if (state is! ReviewableProductsLoaded || state.products.isEmpty) {
          return const SizedBox.shrink();
        }

        final count = state.products.length;
        final label = state.hasMore ? '$count+' : '$count';
        final form = (count == 1 && !state.hasMore) ? 'one' : 'other';
        final theme = Theme.of(context).colorScheme;

        return Card(
          margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          color: theme.primary,
          child: ListTile(
            leading: Icon(Icons.rate_review_outlined, color: theme.onPrimary),
            title: Text(
              S.of(context).pendingReviewsTitle(form, label),
              style: TextStyle(
                color: theme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              S.of(context).pendingReviewsSubtitle,
              style: TextStyle(color: theme.onPrimary.withValues(alpha: 0.8)),
            ),
            trailing: Icon(Icons.chevron_right, color: theme.onPrimary),
            onTap: () {
              context.push(RateYourPurchasesView.routeName);
            },
          ),
        );
      },
    );
  }
}
