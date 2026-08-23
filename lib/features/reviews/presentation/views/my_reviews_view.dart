import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/my_reviews_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyReviewsView extends StatelessWidget {
  const MyReviewsView({super.key});

  static const routeName = '/my-reviews';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).my_reviews,
      child: MyReviewsViewBody(),
    );
  }
}
