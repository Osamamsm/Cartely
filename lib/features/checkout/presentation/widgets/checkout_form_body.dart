import 'package:e_commerce/core/dependency_injection/di.dart';
import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/review_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/step_indicator.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutFormBody extends StatelessWidget {
  const CheckoutFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFlowCubit, int>(
      builder: (context, step) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: StepIndicator(
                currentStep: step,
                steps: [
                  S.of(context).address_step,
                  S.of(context).payment_step,
                  S.of(context).review_step,
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: step,
                children: [
                  BlocProvider(
                    create: (context) =>
                        getIt<AddressesCubit>()..getAddresses(),
                    child: AddressStep(),
                  ),
                  PaymentStep(
                    paymentMethods: Constants.getPaymentMethods(context),
                    selectedPaymentType: context
                        .read<CheckoutCubit>()
                        .state
                        .selectedPaymentType!,
                  ),
                  ReviewStep(
                    selectedAddress:
                        context.read<CheckoutCubit>().state.selectedAddress ??
                        AddressEntity(
                          additionalNotes: '',
                          governorate: '',
                          city: '',
                          district: '',
                          street: '',
                          building: '',
                          floor: 5,
                          apartmentNumber: 5,
                          label: '',
                          isDefault: false,
                        ),
                    selectedPayment: Constants.getPaymentMethods(context)
                        .firstWhere(
                          (p) =>
                              p.type ==
                              context
                                  .read<CheckoutCubit>()
                                  .state
                                  .selectedPaymentType,
                        ),
                    cart: context.read<CheckoutCubit>().state.cart!,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
