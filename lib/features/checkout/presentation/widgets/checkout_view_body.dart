import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_state.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_form_body.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_result_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state.orderStatus == OrderStatus.initial) {
          return CheckoutFormBody();
        } else {
          context.read<CartCubit>().resetCart();
          return CheckoutResultBody();
        }
      },
    );
  }
}
