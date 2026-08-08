class Order {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final double subtotal;
  final double shipping;
  final double total;
  final String orderStatus;
  final String paymentStatus;
  final int itemCount;
  final String? thumbnailUrl;

  const Order({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.orderStatus,
    required this.paymentStatus,
    required this.itemCount,
    this.thumbnailUrl,
  });
}