import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/orders/presentation/widgets/order_details_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
class OrderDetailsView extends StatelessWidget {

  static const routeName = '/order-details-view';

  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).orderDetails,
      child:OrderDetailsViewBody(),
    );
  }
}