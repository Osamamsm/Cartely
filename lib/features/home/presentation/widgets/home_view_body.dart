import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_bloc_builder.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/products_filter_sort_bar.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_bloc_builder.dart';
import 'package:e_commerce/features/home/presentation/widgets/promotions_bloc_builder.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            final double position = notification.metrics.pixels;

            final double max = notification.metrics.maxScrollExtent;

            final int triggerDistance = 200;

            if (position >= max - triggerDistance) {
              context.read<ProductFeedCubit>().loadMoreProducts();
            }
          }
          return false;
        },
        child: CustomScrollView(
          scrollDirection: .vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 50, child: CustomSearchTextField()),
                  vGap(12),
                  PromotionsBlocBuilder(),
                  vGap(10),
                  Text(
                    S.of(context).shop_by_category,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  vGap(12),
                  CategoriesBlocBuilder(),
                  vGap(12),
                  ProductsFilterSortBar(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: vGap(12)),
            ProductsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
