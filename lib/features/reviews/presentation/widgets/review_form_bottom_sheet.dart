import 'package:e_commerce/features/reviews/presentation/widgets/review_form.dart';
import 'package:flutter/material.dart';

class ReviewFormBottomSheet extends StatelessWidget {
  const ReviewFormBottomSheet({
    super.key,
    required this.onSubmit,
    this.initialComment = '',
    this.initialRating = 0,
    required this.isEdit,
  });

  final void Function(String comment, double rating) onSubmit;

  final String initialComment;
  final double initialRating;

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: ReviewForm(
          initialComment: initialComment,
          initialRating: initialRating,
          onSubmit: onSubmit,
          isEdit: isEdit,
        ),
      ),
    );
  }
}
