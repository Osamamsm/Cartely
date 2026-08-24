import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/custom_popup_menu_button.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/reviews/domain/entities/user_review.dart';
import 'package:e_commerce/features/reviews/presentation/logic/user_reviews_ccubit/user_reviews_cubit.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/open_review_sheet.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.review});

  final UserReview review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ProductImage(
              imageUrl: review.productImageUrl,
              width: 56,
              height: 56,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.localizedProductName(context),
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    CustomRatingBar(
                      isReadOnly: true,
                      initialRating: review.rating,
                      itemSize: 15,
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat.yMMMd().format(review.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (review.isEdited) ...[
                      hGap(6),
                      Text(
                        S.of(context).edited,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  review.comment,
                  textDirection: getTextDirection(review.comment),
                ),
              ],
            ),
          ),
          CustomPopupMenuButton(
            onEdit: () {
              openUserReviewSheet(
                context: context,
                reviewId: review.id,
                initialRating: review.rating,
                initialComment: review.comment,
              );
            },
            onDelete: () {
              showCustomDialog(
                context: context,
                message: S.of(context).delete_review_confirmation,
                okBtnText: S.of(context).delete,
                cancelBtnText: S.of(context).cancel,
                dialogType: DialogType.warning,
                onOkPressed: () {
                  context.read<UserReviewsCubit>().deleteReview(review.id);
                },
                onCancelPressed: () => context.pop(),
              );
            },
          ),
        ],
      ),
    );
  }
}
