import 'package:e_commerce/features/reviews/presentation/logic/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/logic/user_reviews_ccubit/user_reviews_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/review_form_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void openProductReviewSheet({
  required BuildContext context,
  required bool isEdit,
  String? productId,
  String? reviewId,
  String initialComment = '',
  double initialRating = 0,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: ReviewFormBottomSheet(
          isEdit: isEdit,
          initialComment: initialComment,
          initialRating: initialRating,
          onSubmit: (comment, rating) {
            if (isEdit) {
              context.read<ProductReviewsCubit>().editReview(
                reviewId: reviewId!,
                comment: comment,
                rating: rating,
              );
            } else {
              context.read<ProductReviewsCubit>().addReview(
                productId: productId!,
                comment: comment,
                rating: rating,
              );
            }
            Navigator.of(sheetContext).pop();
          },
        ),
      ),
    ),
  );
}

void openUserReviewSheet({
  required BuildContext context,
  String? reviewId,
  String initialComment = '',
  double initialRating = 0,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: ReviewFormBottomSheet(
          isEdit: true,
          initialComment: initialComment,
          initialRating: initialRating,
          onSubmit: (comment, rating) {
            context.read<UserReviewsCubit>().editReview(
              reviewId: reviewId!,
              comment: comment,
              rating: rating,
            );

            Navigator.of(sheetContext).pop();
          },
        ),
      ),
    ),
  );
}
