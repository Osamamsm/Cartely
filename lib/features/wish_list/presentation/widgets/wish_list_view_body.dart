import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/widgets/empty_body.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_cubit.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_state.dart';
import 'package:e_commerce/features/wish_list/presentation/widgets/wish_list_grid_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: BlocListener<WishlistCubit, WishlistState>(
        listener: (context, state) {
          context.read<GetWishListCubit>().removeIfNotInWishlist(
            state.wishListedIds,
          );
        },
        child: BlocBuilder<GetWishListCubit, GetWishlistState>(
          builder: (context, state) {
            if (state.status == WishlistStatus.failed) {
              return ErrorBody(
                errMessage: state.errMessage,
                onRetry: () => context.read<GetWishListCubit>().getWishList(),
                goHomeEnabled: true,
              );
            } else if (state.status == WishlistStatus.loaded) {
              final products = state.products;
              if (products.isEmpty) {
                return EmptyBody(
                  icon: Icons.favorite_border,
                  title: S.of(context).empty_wishlist,
                  message: S.of(context).empty_wishlist_description,
                  actionLabel: S.of(context).shop_now,
                  onAction: () {
                    context.go(HomeView.routeName);
                  },
                );
              } else {
                return WishListGridView(products: products);
              }
            }
            return WishListGridView(
              isLoading: true,
              products: [
                Product.placeholder(),
                Product.placeholder(),
                Product.placeholder(),
              ],
            );
          },
        ),
      ),
    );
  }
}
