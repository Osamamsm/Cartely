import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';

class CartModel {
  final List<CartItemModel> items;
  final double subtotal;
  final double shippingCost;
  final double total;

  CartModel({
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      shippingCost: (json['shipping_cost'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  Cart toEntity() {
    return Cart(
      items: items.map((item) => item.toEntity()).toList(),
      subtotal: subtotal,
      shippingCost: shippingCost,
      total: total,
    );
  }
}
