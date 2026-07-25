import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_view_bloc_builder.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = '/cart-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).my_cart,
      child: const CartViewBlocBuilder(),
    );
  }
}
