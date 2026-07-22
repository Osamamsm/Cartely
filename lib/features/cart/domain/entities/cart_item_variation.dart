class CartItemVariation {
  final String enName;
  final String arName;
  final String enValue;
  final String arValue;
  final String? hexCode;

  const CartItemVariation({
    required this.enName,
    required this.arName,
    required this.enValue,
    required this.arValue,
    this.hexCode,
  });
}
