import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_info_tab.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/product_reviews_tab.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductDetailsLoadedBody extends StatelessWidget {
  const ProductDetailsLoadedBody({
    super.key,
    required this.product,
    required this.variationNames,
    required this.selectedOptions,
    required this.availableOptionsFor,
    required this.isOptionOutOfStock,
  });

  final ProductDetails product;
  final List<String> variationNames;
  final Map<String, String> selectedOptions;
  final List<VariationOption> Function(String) availableOptionsFor;
  final bool Function(String, String) isOptionOutOfStock;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.titleSmall,
            tabs: [
              Tab(text: S.of(context).product_info),
              Tab(text: S.of(context).product_reviews),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ProductInfoTab(
                  product: product,
                  variationNames: variationNames,
                  selectedOptions: selectedOptions,
                  availableOptionsFor: availableOptionsFor,
                  isOptionOutOfStock: isOptionOutOfStock,
                ),
                ProductReviewsTab(
                  productId: product.productId,
                  avgRating: product.avgRating,
                  reviewsCount: product.reviewCount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
