import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_items_list_view.dart';
import 'package:e_commerce/features/cart/presentation/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cart});

  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: Constants.kHorizontalPaddingMedium,
          child: CartItemsListView(cartItems: cart.items),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: OrderSummaryCard(
            cart: cart,
          ),
        ),
      ],
    );
  }
}
