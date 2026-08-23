import 'package:equatable/equatable.dart';

class ProductReview extends Equatable {
  final String id;
  final String userId;
  final String userFullName;
  final String? userAvatarUrl;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ProductReview({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.userAvatarUrl,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isEdited => updatedAt != null;

  @override
  List<Object?> get props => [
    id,
    userId,
    userFullName,
    userAvatarUrl,
    rating,
    comment,
    createdAt,
    updatedAt,
  ];
}
