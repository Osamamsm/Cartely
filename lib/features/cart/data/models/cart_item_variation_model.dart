import 'package:e_commerce/features/cart/domain/entities/cart_item_variation.dart';

class CartItemVariationModel {
  final String enName;
  final String arName;
  final String enValue;
  final String arValue;
  final String? hexCode;

  const CartItemVariationModel({
    required this.enName,
    required this.arName,
    required this.enValue,
    required this.arValue,
    this.hexCode,
  });

  factory CartItemVariationModel.fromJson(Map<String, dynamic> json) {
    return CartItemVariationModel(
      enName: json['en_name'] as String,
      arName: json['ar_name'] as String,
      enValue: json['en_value'] as String,
      arValue: json['ar_value'] as String,
      hexCode: json['hex_code'] as String?,
    );
  }

  CartItemVariation toEntity() {
    return CartItemVariation(
      enName: enName,
      arName: arName,
      enValue: enValue,
      arValue: arValue,
      hexCode: hexCode,
    );
  }
}