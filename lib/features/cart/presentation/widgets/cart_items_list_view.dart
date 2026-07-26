import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key, required this.cartItems});

  final List<CartItem> cartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: .only(bottom: 260),
      itemCount: cartItems.length,
      itemBuilder: (context, index) =>
          CartItemWidget(cartItem: cartItems[index]),
      separatorBuilder: (context, index) => vGap(12),
    );
  }
}
