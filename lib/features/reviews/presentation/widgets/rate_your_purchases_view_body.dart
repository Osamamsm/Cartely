import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/features/product/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/features/reviews/domain/entities/reviewable_product.dart';
import 'package:e_commerce/features/reviews/presentation/logic/reviewable_products_cubit/reviewable_products_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RateYourPurchasesViewBody extends StatelessWidget {
  const RateYourPurchasesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          context.read<ReviewableProductsCubit>().loadReviewableProducts(),
      child: BlocBuilder<ReviewableProductsCubit, ReviewableProductsState>(
        builder: (context, state) {
          switch (state) {
            case ReviewableProductsInitial():
            case ReviewableProductsLoading():
              return Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, __) => _ReviewableProductCard(
                    product: ReviewableProduct.placeholder(),
                  ),
                ),
              );

            case ReviewableProductsLoadFailure(:final message):
              return ErrorBody(
                errMessage: message,
                onRetry: () => context
                    .read<ReviewableProductsCubit>()
                    .loadReviewableProducts(),
                goHomeEnabled: false,
              );

            case ReviewableProductsLoaded(
              :final products,
              :final isLoadingMore,
            ):
              return NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollEndNotification) {
                    if (notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent - 200) {
                      context.read<ReviewableProductsCubit>().loadMore();
                    }
                  }
                  return false;
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: products.length + (isLoadingMore ? 1 : 0),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    if (index >= products.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2.5),
                          ),
                        ),
                      );
                    }
                    return _ReviewableProductCard(product: products[index]);
                  },
                ),
              );
          }
        },
      ),
    );
  }
}

class _ReviewableProductCard extends StatelessWidget {
  const _ReviewableProductCard({required this.product});

  final ReviewableProduct product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ProductImage(
                imageUrl: product.productImageUrl,
                height: 64,
                width: 64,
              ),
            ),
            hGap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.localizedProductName(context),
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (product.localizedVariation(context) != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      product.localizedVariation(context)!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                  vGap(4),
                  Text(
                    'Order #${product.orderNumber} · ${DateFormat.yMMMd().format(product.purchasedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  vGap(10),
                  _RateProductButton(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RateProductButton extends StatelessWidget {
  const _RateProductButton({required this.product});

  final ReviewableProduct product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FilledButton.tonalIcon(
        onPressed: () => _goToReviewForm(context),
        icon: const Icon(Icons.star_outline, size: 18),
        label: Text(
          S.of(context).rate_this_product,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 10,
          ),
        ),
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }

  void _goToReviewForm(BuildContext context) {
    context.push(
      ProductDetailsView.routeName,
      extra: {'openReviewForm': true, 'productId': product.productId},
    );
  }
}
