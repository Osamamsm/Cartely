class OrderLine{
  final String orderLineId;
  final String productItemId;
  final String productName;
  final int quantity;
  final double price;
  final String? imageUrl;
  final String? variation;

  const OrderLine({
    required this.orderLineId,
    required this.productItemId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
    this.variation,
  });
}