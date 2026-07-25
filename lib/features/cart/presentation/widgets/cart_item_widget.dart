import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/core/widgets/quantity_stepper.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartItem cartItem;
  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    int quantity = widget.cartItem.quantity;
    return Container(
      padding: const .all(10),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: .center,
        children: [
          ProductImage(
            imageUrl: widget.cartItem.productThumbnail,
            height: 100,
            width: 80,
          ),
          hGap(12),
          CartItemDetails(cartItem: widget.cartItem),
          hGap(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: .end,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CartCubit>().removeFromCart(
                    widget.cartItem.cartItemId,
                  );
                },
                icon: const Icon(Icons.close),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              QuantityStepper(
                value: widget.cartItem.quantity,
                onIncrement: () {
                  setState(() => quantity++);
                  context.read<CartCubit>().updateCartItemQuantity(
                    widget.cartItem.cartItemId,
                    quantity,
                  );
                },
                onDecrement: () {
                  setState(() => quantity--);
                  context.read<CartCubit>().updateCartItemQuantity(
                    widget.cartItem.cartItemId,
                    quantity,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
