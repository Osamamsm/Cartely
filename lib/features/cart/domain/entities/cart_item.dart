import 'package:e_commerce/features/cart/domain/entities/cart_item_variation.dart';

class CartItem {
  final String cartItemId;
  final String productItemId;
  final String productId;
  final String productEnName;
  final String productArName;
  final String productThumbnail;
  final double price;
  final int quantity;
  final int stock;
  final List<CartItemVariation> variations;

  const CartItem({
    required this.cartItemId,
    required this.productItemId,
    required this.productId,
    required this.productEnName,
    required this.productArName,
    required this.productThumbnail,
    required this.price,
    required this.quantity,
    required this.stock,
    required this.variations,
  });
}
