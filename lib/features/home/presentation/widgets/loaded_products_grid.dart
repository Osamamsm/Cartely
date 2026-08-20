import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:flutter/material.dart';

class LoadedProductsGrid extends StatefulWidget {
  const LoadedProductsGrid({
    super.key,
    required this.products,
    required this.onLoadMore,
  });

  final List<Product> products;
  final VoidCallback onLoadMore;

  @override
  State<LoadedProductsGrid> createState() => _LoadedProductsGridState();
}

class _LoadedProductsGridState extends State<LoadedProductsGrid> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final position = _controller.position.pixels;
    final max = _controller.position.maxScrollExtent;
    if (position >= max - 200) {
      widget.onLoadMore();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      controller: _controller,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 10,
        childAspectRatio: .52,
      ),
      children: widget.products
          .map((product) => ProductCard(product: product))
          .toList(),
    );
  }
}
