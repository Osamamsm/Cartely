import 'package:e_commerce/features/reviews/domain/entities/review_operation_result.dart';

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

  ReviewOperationResult toEntity() {
    return ReviewOperationResult(success: success, message: message);
  }
}
