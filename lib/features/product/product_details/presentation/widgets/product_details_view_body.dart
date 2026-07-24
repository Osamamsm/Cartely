import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_state.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_details_error_body.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_details_loaded_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        switch (state.status) {
          case CartStatus.operationSuccess:
            _showCartSnackBar(
              context,
              message: state.message!,
              backgroundColor: Colors.green.shade600,
              icon: Icons.check_circle_outline,
            );
            break;

          case CartStatus.operationFailure:
            _showCartSnackBar(
              context,
              message: state.message!,
              backgroundColor: Colors.red.shade600,
              icon: Icons.error_outline,
            );
            break;

          case CartStatus.error:
            _showCartSnackBar(
              context,
              message: state.message!,
              backgroundColor: Colors.red.shade600,
              icon: Icons.wifi_off_rounded,
            );
            break;

          default:
            break;
        }
      },
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return Skeletonizer(
              child: ProductDetailsLoadedBody(
                product: ProductDetails.placeholder(),
                variationNames: [],
                selectedOptions: const {},
                availableOptionsFor: (_) => [],
                isOptionOutOfStock: (_, _) => false,
              ),
            );
          } else if (state is ProductDetailsLoaded) {
            return ProductDetailsLoadedBody(
              product: state.product,
              variationNames: state.variationNames,
              selectedOptions: state.selectedOptions,
              availableOptionsFor: state.availableOptionsFor,
              isOptionOutOfStock: state.isOptionOutOfStock,
            );
          } else if (state is ProductDetailsError) {
            return ProductDetailsErrorBody(
              message: state.message,
              onRetry: () => context
                  .read<ProductDetailsCubit>()
                  .loadProductDetails(productId),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

void _showCartSnackBar(
  BuildContext context, {
  required String message,
  required Color backgroundColor,
  required IconData icon,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
}
