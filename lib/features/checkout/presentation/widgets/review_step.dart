import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/core/widgets/summary_row.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_details_section.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_method_details_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewStep extends StatelessWidget {
  final AddressEntity selectedAddress;
  final PaymentMethod selectedPayment;
  final List<OrderItem> orderItems;

  const ReviewStep({
    super.key,
    required this.selectedAddress,
    required this.selectedPayment,
    required this.orderItems,
  });

  double get subtotal => orderItems.fold(0, (sum, item) => sum + item.price);
  double get shipping => 15.00;
  double get tax => subtotal * 0.1; // 10% tax
  double get total => subtotal + shipping + tax;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).delivery_address,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(12),
                _AddressSummary(address: selectedAddress),
                vGap(24),
                Text(
                  S.of(context).payment_method,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(12),
                _PaymentSummary(payment: selectedPayment),
                vGap(24),
                Text(
                  S.of(context).order_summary,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(16),
                ...orderItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _OrderItemCard(item: item),
                  ),
                ),
                vGap(8),
                _PriceSummary(
                  subtotal: subtotal,
                  shipping: shipping,
                  tax: tax,
                  total: total,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(S.of(context).place_order),
              ),
              TextButton(
                onPressed: () {
                  context.read<CheckoutFlowCubit>().goToPreviousStep();
                },
                child: Text(
                  S.of(context).back_to_payment,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5), fontSize: 14),
                ),
              ),
              vGap(8),
            ],
          ),
        ),
      ],
    );
  }
}

class _AddressSummary extends StatelessWidget {
  final AddressEntity address;

  const _AddressSummary({required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              address.label == 'Home' ? Icons.home : Icons.business,
              color: Theme.of(context).colorScheme.primary,
              size: 18,
            ),
          ),
          hGap(12),
          AddressDetailsSection(address: address),
        ],
      ),
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  final PaymentMethod payment;

  const _PaymentSummary({required this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.error, Theme.of(context).colorScheme.secondary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          hGap(12),
          PaymentMethodDetailsSection(payment: payment),
        ],
      ),
    );
  }
}

class _OrderItemCard extends StatelessWidget {
  final OrderItem item;

  const _OrderItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.shopping_bag,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.color,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${item.price.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceSummary extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;

  const _PriceSummary({
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SummaryRow(label: s.subtotal, value: subtotal),
          vGap(8),
          SummaryRow(label: s.shipping, value: shipping),
          vGap(8),
          SummaryRow(label: s.tax, value: tax),
          vGap(8),
          SummaryRow(label: s.discount, value: 0),
          vGap(8),
          Divider(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: .1),
          ),
          SummaryRow(label: s.total, value: total, isTotal: true),
          vGap(8),
        ],
      ),
    );
  }
}
