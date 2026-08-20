import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishListGridView extends StatefulWidget {
  const WishListGridView({
    super.key,
    required this.products,
    this.isLoading = false,
  });

  final List<Product> products;
  final bool isLoading;

  @override
  State<WishListGridView> createState() => _WishListGridViewState();
}

class _WishListGridViewState extends State<WishListGridView> {
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
      context.read<GetWishListCubit>().loadMoreProducts();
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
    return Skeletonizer(
      enabled: widget.isLoading,
      child: GridView.builder(
        controller: _controller,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 10,
          childAspectRatio: .52,
        ),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: widget.products[index]);
        },
      ),
    );
  }
}
