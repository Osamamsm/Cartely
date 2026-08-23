import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_description_section.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_header_section.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_images_carousel_view.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/variation_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfoTab extends StatelessWidget {
  const ProductInfoTab({
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
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(10),
            ProductImagesCarouselView(
              productImages: product.images.map((i) => i.imageUrl).toList(),
            ),
            vGap(20),
            ProductHeaderSection(productDetails: product),
            vGap(10),
            ...variationNames.map((variationName) {
              final options = availableOptionsFor(variationName);
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: VariationSelector(
                  label: variationName,
                  options: options,
                  selected: selectedOptions[variationName],
                  isOutOfStock: (varEn, optEn) =>
                      isOptionOutOfStock(varEn, optEn),
                  onSelect: (optionEn) => context
                      .read<ProductDetailsCubit>()
                      .selectOption(variationName, optionEn),
                ),
              );
            }),
            ProductDescriptionSection(productDetails: product),
            vGap(20),
          ],
        ),
      ),
    );
  }
}
