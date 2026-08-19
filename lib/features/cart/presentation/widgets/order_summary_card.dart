import 'dart:ui';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/gradient_elevated_button.dart';
import 'package:e_commerce/core/widgets/summary_row.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.cart,
    this.tax,
    this.discount,
  });
  final Cart cart;
  final double? tax;
  final double? discount;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.primaryContainer.withValues(alpha: .5),
          ),

          child: Column(
            children: [
              SummaryRow(label: s.subtotal, value: cart.subtotal),
              vGap(8),
              SummaryRow(label: s.shipping, value: cart.shippingCost),
              vGap(8),
              tax != null
                  ? SummaryRow(label: s.tax, value: tax!)
                  : const SizedBox.shrink(),
              vGap(8),
              discount != null
                  ? SummaryRow(label: s.discount, value: discount!)
                  : const SizedBox.shrink(),
              vGap(8),
              Divider(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: .1),
              ),
              SummaryRow(label: s.total, value: cart.total, isTotal: true),
              vGap(8),
              GradientElevatedButton(
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).push(CheckoutView.routeName, extra: cart);
                },
                child: Text(s.proceed_to_checkout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
