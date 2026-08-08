import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/orders/domain/entity/order_line.dart';

class OrderDetails {
  final String orderId;
  final String orderNumber;
  final DateTime createdAt;
  final double subtotal;
  final double shipping;
  final double total;
  final double discountAmount;
  final String orderStatus;
  final String paymentStatus;
  final AddressEntity address;
  final List<OrderLine> items;

  const OrderDetails({
    required this.orderId,
    required this.orderNumber,
    required this.createdAt,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.discountAmount,
    required this.orderStatus,
    required this.paymentStatus,
    required this.address,
    required this.items,
  });
}