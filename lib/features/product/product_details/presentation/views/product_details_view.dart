import 'package:e_commerce/core/widgets/cart_button.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_details_view_body.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_purchase_bar.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_cubit.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const routeName = '/product-details-view';
  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final String productId;
    final bool openReviewForm;

    if (extra is Map) {
      productId = extra['productId'] as String;
      openReviewForm = extra['openReviewForm'] as bool? ?? false;
    } else {
      productId = extra as String;
      openReviewForm = false;
    }
    return CustomScaffold(
      actionWidgets: [
        BlocSelector<WishlistCubit, WishlistState, bool>(
          selector: (state) => state.isWishListed(productId),
          builder: (context, isWishListed) {
            return IconButton(
              icon: Icon(
                isWishListed ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => context.read<WishlistCubit>().toggle(productId),
            );
          },
        ),
        const CartButton(),
      ],
      customBottomNavigationBar: ProductPurchaseBar(),
      child: ProductDetailsViewBody(productId: productId, openReviewForm: openReviewForm),
    );
  }
}
