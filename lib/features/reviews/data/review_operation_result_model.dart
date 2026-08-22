import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';

class ReviewOperationResultModel {
  final bool success;
  final String message;

  const ReviewOperationResultModel({
    required this.success,
    required this.message,
  });

  factory ReviewOperationResultModel.fromJson(Map<String, dynamic> json) {
    return ReviewOperationResultModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  CartOperationResult toEntity() {
    return CartOperationResult(success: success, message: message);
  }
}
