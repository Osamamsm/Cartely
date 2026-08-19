import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.push(CartView.routeName);
      },
      icon: BlocSelector<CartCubit, CartState, int>(
        selector: (state) {
          return state.cart.items.length;
        },
        builder: (context, state) {
          return Badge.count(
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            isLabelVisible: state > 0,
            count: state,
            child: const Icon(Icons.shopping_cart_outlined),
          );
        },
      ),
    );
  }
}
