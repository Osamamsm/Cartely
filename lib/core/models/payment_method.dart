class PaymentMethod {
  final String id;
  final PaymentType type;
  final String label;
  final String description;
  final bool isDefault;
  final bool isEnabled;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.label,
    required this.description,
    required this.isDefault,
    required this.isEnabled
  });
}

enum PaymentType { card, digitalWallet, cashOnDelivery }
