import 'package:e_commerce/core/widgets/empty_body.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartViewBlocBuilder extends StatelessWidget {
  const CartViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.status == CartStatus.loading) {
          return Skeletonizer(child: CartViewBody(cart: Cart.placeHolder()));
        } else if (state.status == CartStatus.error) {
          return ErrorBody(
            onRetry: () => context.read<CartCubit>().getCart(),
            errMessage: state.message!,
            goHomeEnabled: true,
          );
        } else {
          if (state.cart.items.isEmpty) {
            return EmptyBody(
              icon: Icons.shopping_cart_outlined,
              title: S.of(context).my_cart,
              message: S.of(context).emptyCartDescription,
              actionLabel: S.of(context).startShopping,
              onAction: () {
                context.go(HomeView.routeName);
              },
            );
          }
          return CartViewBody(cart: state.cart);
        }
      },
    );
  }
}
