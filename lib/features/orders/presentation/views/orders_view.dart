import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static String routeName = "/orders-view";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).my_orders,
      child: OrdersViewBody(),
    );
  }
}
