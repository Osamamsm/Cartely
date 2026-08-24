import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({
    super.key,
    required this.icon,
    required this.message,
    this.title,
    this.iconSize = 96,
    this.iconColor,
    this.actionLabel,
    this.onAction,
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
  });

  final IconData icon;
  final String message;
  final String? title;
  final double iconSize;
  final Color? iconColor;
  final String? actionLabel;
  final VoidCallback? onAction;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
            ),
            vGap(16),
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              vGap(8),
            ],
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              vGap(20),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
