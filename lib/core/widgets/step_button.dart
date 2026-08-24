import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.enabled,
  });

  final VoidCallback onTap;
  final IconData icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enabled
              ? scheme.primary
              : scheme.primary.withValues(alpha: .12),
        ),
        child: Icon(
          icon,
          size: 16,
          color: enabled
              ? scheme.onPrimary
              : scheme.onSurface.withValues(alpha: .35),
        ),
      ),
    );
  }
}
