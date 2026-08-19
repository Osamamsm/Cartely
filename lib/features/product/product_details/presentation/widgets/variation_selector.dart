import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:flutter/material.dart';
import 'color_selector.dart';
import 'TextVariationSelector.dart';

class VariationSelector extends StatelessWidget {
  const VariationSelector({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelect,
    required this.isOutOfStock,
  });

  final String label;
  final List<VariationOption> options;
  final String? selected;
  final ValueChanged<String> onSelect;
  final bool Function(String variationEn, String optionEn) isOutOfStock;

  VariationOption? _selectedOption() {
    if (selected == null) return null;
    for (final o in options) {
      if (o.optionEn == selected) return o;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final hasColors = options.any((o) => o.hexCode != null);
    final selectedOption = _selectedOption();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: theme.textTheme.headlineMedium),
            if (selectedOption != null && hasColors) ...[
              hGap(8),
              Text(
                selectedOption.localizedOption(context),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
        vGap(10),
        if (hasColors)
          ColorSelector(
            options: options,
            selectedOptionEn: selected,
            onChanged: onSelect,
            size: 40,
            activeBorderColor: theme.colorScheme.primary,
            isOutOfStock: (optionEn) => isOutOfStock(label, optionEn),
          )
        else
          TextVariationSelector(
            options: options,
            selectedOptionEn: selected,
            onChanged: onSelect,
            isOutOfStock: (optionEn) => isOutOfStock(label, optionEn),
          ),
      ],
    );
  }
}
