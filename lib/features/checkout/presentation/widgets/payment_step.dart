import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/continue_button.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_method_details_section.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/selectable_card_widget.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentStep extends StatefulWidget {
  final List<PaymentMethod> paymentMethods;
  final PaymentType selectedPaymentType;

  const PaymentStep({
    super.key,
    required this.paymentMethods,
    required this.selectedPaymentType,
  });

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  late PaymentType _selectedPaymentType;

  @override
  void initState() {
    super.initState();
    _selectedPaymentType = widget.selectedPaymentType;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).payment_method,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                          letterSpacing: 1.2,
                        ),
                      ),
                      vGap(16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList.separated(
                  itemCount: widget.paymentMethods.length,
                  itemBuilder: (context, index) {
                    final payment = widget.paymentMethods[index];
                    return _PaymentSelectableCard(
                      payment: payment,
                      isSelected: payment.type == _selectedPaymentType,
                      onTap: () {
                        context.read<CheckoutCubit>().setPaymentMethod(
                          paymentType: payment.type,
                        );
                        setState(() {
                          context.read<CheckoutCubit>().setPaymentMethod(
                            paymentType: payment.type,
                          );
                          _selectedPaymentType = payment.type;
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) => vGap(16),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            ContinueButton(
              label: S.of(context).continue_to_review,
              onPressed: () {
                context.read<CheckoutFlowCubit>().goToNextStep();
              },
            ),
            TextButton(
              onPressed: () {
                context.read<CheckoutFlowCubit>().goToPreviousStep();
              },
              child: Text(
                S.of(context).back_to_address,
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                  fontSize: 14,
                ),
              ),
            ),
            vGap(8),
          ],
        ),
      ],
    );
  }
}

class _PaymentSelectableCard extends StatelessWidget {
  final PaymentMethod payment;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentSelectableCard({
    required this.payment,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getIcon() {
    switch (payment.type) {
      case PaymentType.card:
        return Icons.credit_card;
      case PaymentType.digitalWallet:
        return Icons.account_balance_wallet;
      case PaymentType.cashOnDelivery:
        return Icons.attach_money;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableCardWidget(
      isEnabled: payment.isEnabled,
      isSelected: isSelected,
      onTap: onTap,
      icon: _getIcon(),
      child: PaymentMethodDetailsSection(payment: payment),
    );
  }
}
