import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/widgets/empty_body.dart';
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/loaded_products_grid.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsViewBody extends StatelessWidget {
  const SearchResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
        builder: (context, state) {
          if (state.status == ProductsStatus.failed) {
            return Center(child: Text(state.errMessage));
          } else if (state.status == ProductsStatus.loaded) {
            final products = state.products;
            if (products.isEmpty) {
              return EmptyBody(
                icon: Icons.search,
                title: S.of(context).no_results,
                message: S.of(context).no_results_description,
              );
            }
            return LoadedProductsGrid(
              products: products,
              onLoadMore: () {
                context.read<ProductSearchCubit>().loadMoreProducts();
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
