import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/models/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodDetailsSection extends StatelessWidget {
  const PaymentMethodDetailsSection({super.key, required this.payment});

  final PaymentMethod payment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(payment.label, style: Theme.of(context).textTheme.titleSmall),
          vGap(4),
          Text(
            payment.description,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Colors.grey),
          ),
          //_buildCardDetails(),
        ],
      ),
    );
  }
}
