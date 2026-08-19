import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class SelectableCardWidget extends StatelessWidget {
  const SelectableCardWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.child,
    required this.icon,
    this.isEnabled = true,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;
  final IconData icon;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isEnabled
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isEnabled && isSelected
                ? colorScheme.primary
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isEnabled
                    ? colorScheme.secondaryContainer
                    : colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isEnabled
                    ? colorScheme.primary
                    : colorScheme.onSurface.withValues(alpha: 0.4),
                size: 20,
              ),
            ),
            hGap(16),
            Expanded(
              child: Opacity(opacity: isEnabled ? 1 : 0.5, child: child),
            ),
            _CircleCheckbox(isSelected: isSelected, isEnabled: isEnabled),
          ],
        ),
      ),
    );
  }
}

class _CircleCheckbox extends StatelessWidget {
  const _CircleCheckbox({required this.isSelected, required this.isEnabled});

  final bool isSelected;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: !isEnabled
              ? colorScheme.onSurface.withValues(alpha: 0.2)
              : isSelected
              ? colorScheme.primary
              : colorScheme.surface,
          width: 2,
        ),
        color: !isEnabled
            ? colorScheme.surfaceContainerHighest
            : isSelected
            ? colorScheme.primary
            : Colors.transparent,
      ),
      child: isSelected && isEnabled
          ? const Icon(Icons.check, color: Colors.white, size: 16)
          : null,
    );
  }
}
