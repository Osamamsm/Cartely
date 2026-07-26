import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/quantity_stepper.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_state.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPurchaseBar extends StatefulWidget {
  const ProductPurchaseBar({super.key});

  @override
  State<ProductPurchaseBar> createState() => _ProductPurchaseBarState();
}

class _ProductPurchaseBarState extends State<ProductPurchaseBar> {
  int quantity = 1;
  void increment() => setState(() => quantity++);
  void decrement() => setState(() => quantity--);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final selectedItemId = state is ProductDetailsLoaded
            ? state.selectedItemId
            : null;
        final canAddToCart = state is ProductDetailsLoaded
            ? state.canAddToCart
            : false;
        return Container(
          padding: Constants.kHorizontalPaddingMedium,
          height: 70,
          color: Theme.of(context).colorScheme.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityStepper(
                value: quantity,
                onIncrement: increment,
                onDecrement: decrement,
              ),
              hGap(20),
              Expanded(
                child: ElevatedButton(
                  onPressed: (canAddToCart && selectedItemId != null)
                      ? () => context.read<CartCubit>().addToCart(
                          selectedItemId,
                          quantity,
                        )
                      : null,
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state.status == CartStatus.loading) {
                        return SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        );
                      }
                      return Text(S.of(context).add_to_cart);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
