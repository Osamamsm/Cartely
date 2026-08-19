class Order {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final double subtotal;
  final double shipping;
  final double total;
  final OrderStatus orderStatus;
  final String paymentStatus;
  final int itemCount;
  final String thumbnailUrl;

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
    required this.thumbnailUrl,
  });

  factory Order.placeHolder() => Order(
    orderId: '',
    orderNumber: '',
    createdAt: DateTime.now(),
    subtotal: 0,
    shipping: 0,
    total: 0,
    orderStatus: OrderStatus.pending,
    paymentStatus: '',
    itemCount: 5,
    thumbnailUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRza7C1P_ul5iWEoIeREXOqDdKeqcM3YkBRuQJCZx2wIQ&s=10',
  );
}

enum OrderStatus {
  pending,
  confirmed,
  processing,
  shipped,
  delivered,
  outForDelivery,
  cancelled,
  returned,
}

extension OrderStatusX on OrderStatus {
  String get value => name;
}
