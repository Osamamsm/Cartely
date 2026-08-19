import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_state.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_form_body.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_result_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) =>
          previous.orderStatus != current.orderStatus,
      listener: (context, state) async {
        if (state.orderStatus == OrderStatus.awaitingPayment) {
          final url = Uri.parse(state.placedOrder!.checkoutUrl!);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        }
        if (state.orderStatus == OrderStatus.orderPlaced) {
          if (!context.mounted) return;
          context.read<CartCubit>().resetCart();
        }
      },
      builder: (context, state) {
        if (state.orderStatus == OrderStatus.initial) {
          return const CheckoutFormBody();
        }
        return const CheckoutResultBody();
      },
    );
  }
}
