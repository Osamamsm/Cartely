import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:flutter/material.dart';

class TextVariationSelector extends StatelessWidget {
  const TextVariationSelector({
    super.key,
    required this.options,
    required this.selectedOptionEn,
    required this.onChanged,
    required this.isOutOfStock,
  });

  final List<VariationOption> options;
  final String? selectedOptionEn;
  final ValueChanged<String> onChanged;
  final bool Function(String optionEn) isOutOfStock;

  @override
  Widget build(BuildContext context) {
    final childrenMap = {
      for (final opt in options)
        opt.optionEn: Text(
          opt.localizedOption(context),
          style: TextStyle(
            decoration: isOutOfStock(opt.optionEn)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: isOutOfStock(opt.optionEn)
                ? Theme.of(context).colorScheme.outline
                : null,
          ),
        ),
    };

    return CustomSlidingSegmentedControl<String>(
      initialValue: selectedOptionEn,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      thumbDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      isStretch: true,
      children: childrenMap,
      onValueChanged: onChanged,
    );
  }
}
