import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/features/home/presentation/widgets/fav_button.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/generated/l10n.dart';
//import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountPercentage != null && product.discountPercentage! > 0;

    return InkWell(
      onTap: () =>
          context.push(ProductDetailsView.routeName, extra: product.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProductImage(
                imageUrl: product.imageUrl,
                height: 220,
                width: double.infinity,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: FavButton(productId: product.id),
              ),
            ],
          ),
          vGap(8),
          Text(
            Localizations.localeOf(context).languageCode == 'ar'
                ? product.arName
                : product.enName,
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          vGap(4),
          Row(
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
              hGap(4),
              Text(
                product.rating.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              hGap(4),
              Text(
                '(${product.reviewsCount})',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
          vGap(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasDiscount) ...[
                Text(
                  '${product.basePrice.toStringAsFixed(2)} ${S.of(context).egp}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                hGap(6),
                Text(
                  '${product.discountedPrice.toStringAsFixed(2)} ${S.of(context).egp}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ] else
                Text(
                  '${product.basePrice.toStringAsFixed(2)} ${S.of(context).egp}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),
          /*vGap(8),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).add_to_cart),
            ),
          ),*/
        ],
      ),
    );
  }
}
