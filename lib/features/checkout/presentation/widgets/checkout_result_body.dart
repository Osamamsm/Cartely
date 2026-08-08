import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_state.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/order_failed_body.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/order_placed_body.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/placing_order_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutResultBody extends StatelessWidget {
  const CheckoutResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        switch (state.orderStatus) {
          case OrderStatus.orderPlaced:
            return OrderPlacedBody(orderNumber: state.placedOrder!.orderNumber);

          case OrderStatus.orderRejected:
          case OrderStatus.failure:
            return OrderFailedBody(
              message: state.message ?? S.of(context).something_went_wrong,
              isRejected: state.orderStatus == OrderStatus.orderRejected,
            );

          case OrderStatus.loading:
          case OrderStatus.initial:
          default:
            return const PlacingOrderBody();
        }
      },
    );
  }
}
