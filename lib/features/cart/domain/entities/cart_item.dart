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

  CartItem copyWith({
    String? cartItemId,
    String? productItemId,
    String? productId,
    String? productEnName,
    String? productArName,
    String? productThumbnail,
    double? price,
    int? quantity,
    int? stock,
    List<CartItemVariation>? variations,
  }) {
    return CartItem(
      cartItemId: cartItemId ?? this.cartItemId,
      productItemId: productItemId ?? this.productItemId,
      productId: productId ?? this.productId,
      productEnName: productEnName ?? this.productEnName,
      productArName: productArName ?? this.productArName,
      productThumbnail: productThumbnail ?? this.productThumbnail,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      stock: stock ?? this.stock,
      variations: variations ?? this.variations,
    );
  }
}
