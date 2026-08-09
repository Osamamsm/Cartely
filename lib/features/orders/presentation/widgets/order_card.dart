import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final s = S.of(context);

    return GestureDetector(
      onTap: () {
        // context.push(
        //   OrderDetailsScreen.routeName,
        //   extra: order,
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.primaryContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colors.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${order.total.toStringAsFixed(2)}',
                        style: textTheme.titleMedium?.copyWith(
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                      vGap(4),
                      Text(
                        s.orderNumber(order.orderNumber),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      vGap(2),
                      Text(
                        s.placedOn(
                          DateFormat(
                            'MMM d, yyyy',
                            Localizations.localeOf(context).languageCode,
                          ).format(order.createdAt),
                        ),
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onPrimaryContainer.withValues(
                            alpha: 0.55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                hGap(12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    order.thumbnailUrl,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            vGap(12),
            _StatusBadge(
              status: order.orderStatus,
            ),
            if (order.orderStatus == OrderStatus.shipped) ...[
              vGap(12),
              Text(
                s.orderOnItsWay,
                style: textTheme.labelLarge?.copyWith(
                  color: colors.onPrimaryContainer,
                ),
              ),
              vGap(8),
            ],
            vGap(14),
            _OrderCardActions(order: order),
          ],
        ),
      ),
    );
  }
}

class _OrderCardActions extends StatelessWidget {
  final Order order;

  const _OrderCardActions({
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    switch (order.orderStatus) {
      case OrderStatus.pending:
        return _ActionButton(
          label: l10n.cancelOrder,
          onTap: () {
            // TODO: Cancel order
          },
        );

      case OrderStatus.processing:
      case OrderStatus.confirmed:
        return Row(
          children: [
            Expanded(
              child: _ActionButton(
                label: l10n.trackOrder,
                onTap: () {
                  // TODO: Track order
                },
              ),
            ),
            hGap(10),
            Expanded(
              child: _ActionButton(
                label: l10n.showDetails,
                onTap: () {
                  // TODO: Navigate to order details / receipt
                },
              ),
            ),
          ],
        );

      case OrderStatus.shipped:
      case OrderStatus.outForDelivery:
        return _ActionButton(
          label: l10n.trackOrder,
          onTap: () {
            // TODO: Track order
          },
        );

      case OrderStatus.delivered:
        return _ActionButton(
          label: l10n.reorder,
          icon: Icons.replay_rounded,
          filled: true,
          onTap: () {
            // TODO: Reorder
          },
        );

      case OrderStatus.cancelled:
      case OrderStatus.returned:
        return const SizedBox.shrink();
    }
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final bool filled;
  final IconData? icon;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.onTap,
    this.filled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    if (filled) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 17,
          ),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            foregroundColor: colors.onPrimary,
            backgroundColor: colors.primary,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.onSurface,
          side: BorderSide(
            color: colors.outline,
          ),
          backgroundColor: colors.surface.withValues(
            alpha: 0.25,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: colors.onSurface,
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const _StatusBadge({
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