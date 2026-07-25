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
  final double lineSubtotal;
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
    required this.lineSubtotal,
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
    double? lineSubtotal,
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
      lineSubtotal: lineSubtotal ?? this.lineSubtotal,
      variations: variations ?? this.variations,
    );
  }

  factory CartItem.placeHolder() => CartItem(
    cartItemId: '1',
    productItemId: '11',
    productId: '111',
    productEnName: 'Product Name',
    productArName: 'اسم المنتج',
    productThumbnail: 'https://example.com/thumbnail.jpg',
    price: 0.0,
    quantity: 0,
    stock: 0,
    lineSubtotal: 0.0,
    variations: [
      CartItemVariation.placeHolder(),
      CartItemVariation.placeHolder(),
    ],
  );
}
