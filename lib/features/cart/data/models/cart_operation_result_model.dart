import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';

class CartOperationResultModel {
  final bool success;
  final String message;

  const CartOperationResultModel({required this.success, required this.message});

  factory CartOperationResultModel.fromJson(Map<String, dynamic> json) {
    return CartOperationResultModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  CartOperationResult toEntity() {
    return CartOperationResult(
      success: success,
      message: message,
    );
  }
}
