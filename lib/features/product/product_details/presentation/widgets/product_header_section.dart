import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({super.key, required this.productDetails});

  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Localizations.localeOf(context).languageCode == 'ar'
              ? productDetails.arName
              : productDetails.enName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        Row(
          children: [
            Text(
              'E£${productDetails.discountedPrice ?? productDetails.basePrice}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(flex: 1),
            CustomRatingBar(isReadOnly: true, initialRating: 4.5, itemSize: 20),
            Text(
              S.of(context).review(productDetails.reviewCount),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
