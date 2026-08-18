import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_confirmation_view_body.dart';
import 'package:flutter/material.dart';

class PaymentConfirmationView extends StatelessWidget {
  const PaymentConfirmationView({super.key});

  static String routeName = '/payment-confirmation';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: PaymentConfirmationViewBody());
  }
}
