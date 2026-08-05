//TODO:will be deleted after integrating the supabase database
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

  static List<OrderItem> orderItems = [
  OrderItem(
    id: '1',
    name: 'Sony WH-1000XM5',
    color: 'Black 2023',
    price: 348.00,
    imageUrl: 'https://via.placeholder.com/80',
  ),
  OrderItem(
    id: '2',
    name: 'Apple Watch Series 9',
    color: 'Midnight 45mm',
    price: 399.00,
    imageUrl: 'https://via.placeholder.com/80',
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

class PaymentMethod {
  final String id;
  final PaymentType type;
  final String label;
  final String description;
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.label,
    required this.description,
    required this.isDefault,
  });
}

enum PaymentType { card, digitalWallet, cashOnDelivery }


class OrderItem {
  final String id;
  final String name;
  final String color;
  final double price;
  final String imageUrl;

  OrderItem({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.imageUrl,
  });
}