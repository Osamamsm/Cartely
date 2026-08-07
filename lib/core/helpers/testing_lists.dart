//TODO:will be deleted after integrating the supabase database
import 'package:e_commerce/core/models/payment_method.dart';

class TestingLists {
  static List<PaymentCardModel> paymentCardModels = [
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

  static List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: 'card',
      type: PaymentType.card,
      label: 'Debit/Credit Card',
      description: 'Visa, Mastercard, Amex',
      isDefault: true,
    ),
    PaymentMethod(
      id: 'wallet',
      type: PaymentType.digitalWallet,
      label: 'Digital Wallet',
      description: 'Apple Pay, Google Pay',
      isDefault: false,
    ),
    PaymentMethod(
      id: 'cash',
      type: PaymentType.cashOnDelivery,
      label: 'Cash on Delivery',
      description: 'Pay when you receive',
      isDefault: false,
    ),
  ];
}

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
