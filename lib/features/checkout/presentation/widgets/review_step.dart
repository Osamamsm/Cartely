import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/core/widgets/summary_row.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_details_section.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_method_details_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewStep extends StatelessWidget {
  final AddressEntity selectedAddress;
  final PaymentMethod selectedPayment;
  final Cart cart;

  const ReviewStep({
    super.key,
    required this.selectedAddress,
    required this.selectedPayment,
    required this.cart,
  });

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
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(12),
                _AddressSummary(address: selectedAddress),
                vGap(24),
                Text(
                  S.of(context).payment_method,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(12),
                _PaymentSummary(payment: selectedPayment),
                vGap(24),
                Text(
                  S.of(context).order_summary,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(16),
                ...cart.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _OrderItemCard(item: item),
                  ),
                ),
                vGap(8),
                _PriceSummary(
                  subtotal: cart.subtotal,
                  shipping: cart.shippingCost,
                  tax: 0.00,
                  total: cart.total,
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
                onPressed: () {
                  context.read<CheckoutCubit>().placeOrder(
                    addressId: selectedAddress.id!,
                    paymentType: selectedPayment.type,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(S.of(context).place_order),
              ),
              vGap(8),
              TextButton(
                onPressed: () {
                  context.read<CheckoutFlowCubit>().goToPreviousStep();
                },
                child: Text(
                  S.of(context).back_to_payment,
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 14,
                  ),
                ),
              ),
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
        color: Theme.of(context).colorScheme.primaryContainer,
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
        color: Theme.of(context).colorScheme.primaryContainer,
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
                colors: [
                  Theme.of(context).colorScheme.error,
                  Theme.of(context).colorScheme.secondary,
                ],
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
  final CartItem item;

  const _OrderItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ProductImage(imageUrl: item.productThumbnail, width: 60, height: 60),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? item.productArName
                      : item.productEnName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(height: 1.3),
                ),

                if (getVariationsText(context, item).isNotEmpty)
                  Text(
                    getVariationsText(context, item),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Text(
                      '${item.price.toStringAsFixed(2)} EGP',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      ' x ${item.quantity}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                Text(
                  '${S.of(context).total}: ${item.lineSubtotal.toStringAsFixed(2)} EGP',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
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
        color: Theme.of(context).colorScheme.primaryContainer,
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
