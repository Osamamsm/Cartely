import 'package:e_commerce/core/widgets/cart_button.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/wish_list/presentation/widgets/wish_list_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  static String routeName = "/wishlist";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).wishlist,
      actionWidgets: [const CartButton()],
      child: const WishListViewBody(),
    );
  }
}
