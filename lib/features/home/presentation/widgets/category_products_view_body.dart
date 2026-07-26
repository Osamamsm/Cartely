import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              if (state is GetProductsByCategoryLoaded) {
                return Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 10,
                      childAspectRatio: .52,
                    ),
                    children: state.products
                        .map((product) => ProductCard(product: product))
                        .toList(),
                  ),
                );
              } else if (state is GetProductsByCategoryError) {
                return Center(child: Text(state.message));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
