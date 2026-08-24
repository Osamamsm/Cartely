import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final num value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? theme.textTheme.titleMedium
              : theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: .6),
                ),
        ),
        Text(
          '${value.toStringAsFixed(2)} ${S.of(context).egp}',
          style: isTotal
              ? theme.textTheme.titleMedium
              : theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
