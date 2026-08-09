import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const StatusBadge({super.key, 
    required this.status,
  });

  ({String label, Color color}) _config(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = S.of(context);

    return switch (status) {
      OrderStatus.pending => (
          label: l10n.orderStatusPending,
          color: colors.onSurface.withValues(alpha: 0.55),
        ),
      OrderStatus.confirmed => (
          label: l10n.orderStatusConfirmed,
          color: colors.primary,
        ),
      OrderStatus.processing => (
          label: l10n.orderStatusProcessing,
          color: colors.primary,
        ),
      OrderStatus.shipped => (
          label: l10n.orderStatusShipped,
          color: colors.primary,
        ),
      OrderStatus.outForDelivery => (
          label: l10n.orderStatusOutForDelivery,
          color: colors.primary,
        ),
      OrderStatus.delivered => (
          label: l10n.orderStatusDelivered,
          color: colors.primary,
        ),
      OrderStatus.returned => (
          label: l10n.orderStatusReturned,
          color: colors.error,
        ),
      OrderStatus.cancelled => (
          label: l10n.orderStatusCancelled,
          color: colors.error,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final config = _config(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: config.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        config.label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: config.color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}