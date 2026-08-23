import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/rate_your_purchases_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class RateYourPurchasesView extends StatelessWidget {
  const RateYourPurchasesView({super.key});

  static String routeName = '/rate-your-purchases';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).rate_your_purchases,
      child: RateYourPurchasesViewBody(),
    );
  }
}
