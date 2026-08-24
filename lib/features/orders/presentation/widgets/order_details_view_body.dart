import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_summary.dart';
import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/features/orders/domain/entity/order_details.dart';
import 'package:e_commerce/features/orders/domain/entity/order_line.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_order_details_cubit/get_order_details_cubit.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_order_details_cubit/get_order_details_state.dart';
import 'package:e_commerce/features/orders/presentation/widgets/status_badge.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderDetailsCubit, GetOrderDetailsState>(
      builder: (context, state) {
        if (state is GetOrderDetailsSuccess) {
          return _OrderDetailsBody(orderDetails: state.orderDetails);
        }

        if (state is GetOrderDetailsFailure) {
          return ErrorBody(
            onRetry: () {},
            errMessage: state.message,
            goHomeEnabled: false,
          );
        }

        return Skeletonizer(
          enabled: true,
          child: _OrderDetailsBody(orderDetails: OrderDetails.placeHolder()),
        );
      },
    );
  }
}

class _OrderDetailsBody extends StatelessWidget {
  final OrderDetails orderDetails;

  const _OrderDetailsBody({required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              _OrderSummaryCard(orderDetails: orderDetails),
              vGap(20),
              if (orderDetails.orderStatus != OrderStatus.cancelled &&
                  orderDetails.orderStatus != OrderStatus.returned) ...[
                _SectionLabel(text: s.deliveryStatus),
                vGap(12),
                _StatusTimeline(status: orderDetails.orderStatus),
                vGap(24),
              ],

              _SectionLabel(text: s.orderItems),
              vGap(12),

              ...orderDetails.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _OrderItemTile(item: item),
                ),
              ),
              vGap(12),
              AddressSummary(address: orderDetails.address),
              vGap(12),
              _TotalsCard(orderDetails: orderDetails),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Text(
      text,
      style: theme.textTheme.titleSmall?.copyWith(color: colors.onSurface),
    );
  }
}

class _OrderSummaryCard extends StatelessWidget {
  final OrderDetails orderDetails;

  const _OrderSummaryCard({required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.receipt_long_rounded,
              color: colors.primary,
              size: 28,
            ),
          ),
          hGap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.placedOn(
                    DateFormat(
                      'MMM d, yyyy',
                      Localizations.localeOf(context).languageCode,
                    ).format(orderDetails.createdAt),
                  ),
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.55),
                  ),
                ),
                vGap(6),
                Text(
                  '${orderDetails.total.toStringAsFixed(2)} ${S.of(context).egp}',
                  style: textTheme.titleLarge?.copyWith(
                    color: colors.onSurface,
                  ),
                ),
                vGap(4),
                OrderStatusBadge(status: orderDetails.orderStatus),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusTimeline extends StatelessWidget {
  final OrderStatus status;

  const _StatusTimeline({required this.status});

  int get _activeIndex {
    return switch (status) {
      OrderStatus.confirmed => 0,
      OrderStatus.processing => 0,
      OrderStatus.shipped => 1,
      OrderStatus.outForDelivery => 1,
      OrderStatus.delivered => 2,
      _ => -1,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = S.of(context);

    final steps = [
      l10n.orderStatusProcessing,
      l10n.orderStatusShipped,
      l10n.orderStatusDelivered,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outline),
      ),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            final connectorDone = (index ~/ 2) < _activeIndex;

            return Expanded(
              child: Container(
                height: 2,
                color: connectorDone ? colors.primary : colors.outline,
              ),
            );
          }

          final stepIndex = index ~/ 2;
          final done = stepIndex <= _activeIndex;

          return Column(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done ? colors.primary : colors.surfaceContainerHighest,
                ),
                child: done
                    ? Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: colors.onPrimary,
                      )
                    : null,
              ),
              vGap(6),
              Text(
                steps[stepIndex],
                style: theme.textTheme.labelSmall?.copyWith(
                  color: done
                      ? colors.onSurface
                      : colors.onSurface.withValues(alpha: 0.4),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _OrderItemTile extends StatelessWidget {
  final OrderLine item;

  const _OrderItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.outline),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: item.imageUrl == null
                ? Container(
                    width: 56,
                    height: 56,
                    color: colors.surfaceContainerHighest,
                    child: Icon(
                      Icons.image_outlined,
                      color: colors.onSurface.withValues(alpha: 0.4),
                    ),
                  )
                : Image.network(
                    item.imageUrl!,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
          ),
          hGap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleSmall?.copyWith(
                    color: colors.onSurface,
                  ),
                ),
                vGap(3),
                Text(
                  l10n.quantity(item.quantity),
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                if (item.variation != null && item.variation!.isNotEmpty) ...[
                  vGap(2),
                  Text(
                    item.variation!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ],
            ),
          ),
          hGap(12),
          Text(
            '${item.price.toStringAsFixed(2)} ${S.of(context).egp}',
            style: textTheme.titleSmall?.copyWith(color: colors.onSurface),
          ),
        ],
      ),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  final OrderDetails orderDetails;

  const _TotalsCard({required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = S.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        children: [
          _TotalRow(label: l10n.subtotal, value: orderDetails.subtotal),
          vGap(10),
          _TotalRow(label: l10n.shipping, value: orderDetails.shipping),
          if (orderDetails.discountAmount > 0) ...[
            vGap(10),
            _TotalRow(
              label: l10n.discount,
              value: -orderDetails.discountAmount,
              valueColor: colors.primary,
            ),
          ],
          vGap(14),
          Divider(color: colors.outline, height: 1),
          vGap(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.total,
                style: textTheme.titleMedium?.copyWith(color: colors.onSurface),
              ),
              Text(
                '${orderDetails.total.toStringAsFixed(2)} ${S.of(context).egp}',
                style: textTheme.titleLarge?.copyWith(color: colors.onSurface),
              ),
            ],
          ),
          vGap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.paymentStatus,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.55),
                ),
              ),
              PaymentStatusBadge(status: orderDetails.paymentStatus),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final double value;
  final Color? valueColor;

  const _TotalRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.6),
          ),
        ),
        Text(
          '${value.toStringAsFixed(2)} ${S.of(context).egp}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: valueColor ?? colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
