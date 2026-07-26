import 'package:e_commerce/core/widgets/cart_button.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_products_view_body.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key});

  static const String routeName = '/category-products';
  @override
  Widget build(BuildContext context) {
    final category = GoRouterState.of(context).extra as Category;
    final subCategories = category.subcategories;
    return CustomScaffold(
      title: category.enName,
      actionWidgets: [const CartButton()],
      child: CategoryProductsViewBody(subCategories: subCategories),
    );
  }
}
