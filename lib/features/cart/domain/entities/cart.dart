import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

class Cart {
  final List<CartItem> items;
  final double subtotal;
  final double shippingCost;
  final double total;

  Cart({
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.total,
  });

  factory Cart.empty() =>
      Cart(items: [], subtotal: 0.0, shippingCost: 0.0, total: 0.0);

  Cart copyWith({
    List<CartItem>? items,
    double? subtotal,
    double? shippingCost,
    double? total,
  }) {
    return Cart(
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      shippingCost: shippingCost ?? this.shippingCost,
      total: total ?? this.total,
    );
  }
}
