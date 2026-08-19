import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class PaymentMethodsViewBody extends StatelessWidget {
  const PaymentMethodsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: paymentCardModels.length,
      separatorBuilder: (context, index) => vGap(16),
      itemBuilder: (context, index) {
        return PaymentCard(paymentMethod: paymentCardModels[index]);
      },
    );
  }
}

List<PaymentCardModel> paymentCardModels = [
  PaymentCardModel(
    id: '1',
    type: 'visa',
    lastFour: '5967',
    expiryDate: '09/26',
    cardHolderName: 'Alex Morgan',
    isDefault: true,
  ),
  PaymentCardModel(
    id: '2',
    type: 'mastercard',
    lastFour: '3821',
    expiryDate: '12/24',
    cardHolderName: 'Alex Morgan',
    isDefault: false,
  ),
  PaymentCardModel(
    id: '3',
    type: 'visa',
    lastFour: '1042',
    expiryDate: '01/25',
    cardHolderName: 'Alex Morgan',
    isDefault: false,
  ),
  PaymentCardModel(
    id: '4',
    type: 'mastercard',
    lastFour: '1042',
    expiryDate: '01/25',
    cardHolderName: 'Alex Morgan',
    isDefault: false,
  ),
];

class PaymentCardModel {
  final String id;
  final String type; // 'visa', 'mastercard'
  final String lastFour;
  final String expiryDate;
  final String cardHolderName;
  final bool isDefault;

  PaymentCardModel({
    required this.id,
    required this.type,
    required this.lastFour,
    required this.expiryDate,
    required this.cardHolderName,
    required this.isDefault,
  });
}
