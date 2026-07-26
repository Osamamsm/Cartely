import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    required this.onRetry,
    required this.errMessage,
    required this.goHomeEnabled,
  });

  final VoidCallback onRetry;
  final bool goHomeEnabled;
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 120,
            ),
          ),
          vGap(20),

          Text(
            errMessage,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),

          vGap(10),

          Text(
            S.of(context).error_body_subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          vGap(20),

          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: onRetry,
              child: Text(S.of(context).try_again),
            ),
          ),
          vGap(20),
          goHomeEnabled
              ? GestureDetector(
                  onTap: () {
                    context.replace(HomeView.routeName);
                  },
                  child: Text(
                    S.of(context).go_to_home,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
