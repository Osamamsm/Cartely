import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryProductsViewBody extends StatelessWidget {
  const CategoryProductsViewBody({super.key, required this.subCategories});

  final List<Category> subCategories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: CategoriesListView(
              categories: subCategories,
              onCategorySelected: (category) {
                context
                    .read<GetProductsByCategoryCubit>()
                    .getProductsByCategory(category.id);
              },
            ),
          ),
          BlocBuilder<GetProductsByCategoryCubit, GetProductsByCategoryState>(
            builder: (context, state) {
              if (state.status == ProductsStatus.loaded) {
                return _LoadedProductsGrid(products: state.products);
              } else if (state.status == ProductsStatus.failed) {
                return Center(child: Text(state.errMessage));
              }
              return _ProductsSkeletonizer();
            },
          ),
        ],
      ),
    );
  }
}

class _LoadedProductsGrid extends StatefulWidget {
  const _LoadedProductsGrid({required this.products});

  final List<Product> products;

  @override
  State<_LoadedProductsGrid> createState() => _LoadedProductsGridState();
}

class _LoadedProductsGridState extends State<_LoadedProductsGrid> {
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
      context.read<GetProductsByCategoryCubit>().loadMoreProducts();
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
    return Expanded(
      child: GridView(
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
      ),
    );
  }
}

class _ProductsSkeletonizer extends StatelessWidget {
  const _ProductsSkeletonizer();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 10,
            childAspectRatio: .52,
          ),
          children: List<Product>.generate(
            6,
            ((index) => Product.placeholder()),
          ).map((product) => ProductCard(product: product)).toList(),
        ),
      ),
    );
  }
}
