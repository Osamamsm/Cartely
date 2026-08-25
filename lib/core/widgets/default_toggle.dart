import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class DefaultToggle extends StatelessWidget {
  const DefaultToggle({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.subtitle,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              vGap(4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: scheme.onPrimary,
            activeTrackColor: scheme.primary,
            inactiveThumbColor: scheme.onSurface.withValues(alpha: 0.6),
            inactiveTrackColor: scheme.outline.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
