import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/custom_popup_menu_button.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:e_commerce/features/reviews/presentation/logic/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/features/reviews/domain/entities/product_review.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/open_review_sheet.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ProductReview review;
  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final state = profileCubit.state;
    bool isMyReview = false;
    if (state is ProfileLoaded) {
      isMyReview = review.userId == state.userProfileEntity.id;
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  review.userAvatarUrl ??
                      'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
                ),
              ),
              hGap(10),
              Text(
                review.userFullName,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(flex: 1),
              if (isMyReview)
                CustomPopupMenuButton(
                  onEdit: () {
                    openProductReviewSheet(
                      context: context,
                      reviewId: review.id,
                      initialComment: review.comment,
                      initialRating: review.rating,
                      isEdit: true,
                    );
                  },
                  onDelete: () {
                    showCustomDialog(
                      context: context,
                      message: S.of(context).delete_review_confirmation,
                      okBtnText: S.of(context).yes,
                      cancelBtnText: S.of(context).no,
                      dialogType: DialogType.warning,
                      onOkPressed: () {
                        context.read<ProductReviewsCubit>().deleteReview(
                          review.id,
                        );
                      },
                      showCancelBtn: true,

                      onCancelPressed: () {
                        context.pop();
                      },
                    );
                  },
                ),
            ],
          ),
          vGap(8),
          Row(
            children: [
              CustomRatingBar(
                isReadOnly: true,
                initialRating: review.rating,
                itemSize: 15,
                onRatingUpdate: (rating) {},
              ),
              hGap(8),
              Text(
                DateFormat("yyyy/MM/dd").format(review.createdAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
          vGap(10),
          Text(
            review.comment,
            textDirection: getTextDirection(review.comment),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
