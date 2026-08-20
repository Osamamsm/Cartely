import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
    this.isLoading = false,
  });

  final List<Product> products;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    bool isLoadingMore = context.watch<ProductFeedCubit>().state.isLoadingMore;
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 10,
        childAspectRatio: .52,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == products.length) {
          return Skeletonizer(
            child: ProductCard(product: Product.placeholder()),
          );
        }
        return Skeletonizer(
          enabled: isLoading,
          child: ProductCard(product: products[index]),
        );
      }, childCount: products.length + (isLoadingMore ? 1 : 0)),
    );
  }
}
