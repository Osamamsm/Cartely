import 'package:e_commerce/features/cart/data/models/cart_item_variation_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

class CartItemModel {
  final String cartItemId;
  final String productItemId;
  final String productId;
  final String productEnName;
  final String productArName;
  final String productThumbnail;
  final double price;
  final int quantity;
  final int stock;
  final double lineSubtotal;
  final List<CartItemVariationModel> variations;

  const CartItemModel({
    required this.cartItemId,
    required this.productItemId,
    required this.productId,
    required this.productEnName,
    required this.productArName,
    required this.productThumbnail,
    required this.price,
    required this.quantity,
    required this.stock,
    required this.lineSubtotal,
    required this.variations,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      cartItemId: json['cart_item_id'] as String,
      productItemId: json['product_item_id'] as String,
      productId: json['product_id'] as String,
      productEnName: json['product_en_name'] as String,
      productArName: json['product_ar_name'] as String,
      productThumbnail: json['product_thumbnail'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      lineSubtotal: (json['line_subtotal'] as num).toDouble(),
      variations: (json['variations'] as List)
          .map(
            (e) => CartItemVariationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  CartItem toEntity() {
    return CartItem(
      cartItemId: cartItemId,
      productItemId: productItemId,
      productId: productId,
      productEnName: productEnName,
      productArName: productArName,
      productThumbnail: productThumbnail,
      price: price,
      quantity: quantity,
      stock: stock,
      lineSubtotal: lineSubtotal,
      variations: variations.map((e) => e.toEntity()).toList(),
    );
  }
}
