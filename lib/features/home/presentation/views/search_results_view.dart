import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/search_results_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key, required this.query});

  static const String routeName = '/search-results-view';

  final String query;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleWidget: TextFormField(
        initialValue: query,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search_sharp),
        ),
        onFieldSubmitted: (value) =>
            context.read<ProductSearchCubit>().searchProducts(query: value),
      ),
      child: SearchResultsViewBody(),
    );
  }
}
