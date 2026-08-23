import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class FilterChipsHeaderDelegate extends SliverPersistentHeaderDelegate {
  FilterChipsHeaderDelegate({
    required this.onSelect,
    required this.backgroundColor,
    required this.selectedRating,
  });

  final ValueChanged<double?> onSelect;
  final Color backgroundColor;
  final double? selectedRating;

  static const double _height = 52;

  @override
  double get minExtent => _height;

  @override
  double get maxExtent => _height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _FilterChipsRow(
      onSelect: onSelect,
      backgroundColor: backgroundColor,
      selectedRating: selectedRating,
    );
  }

  @override
  bool shouldRebuild(covariant FilterChipsHeaderDelegate oldDelegate) {
    return oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.selectedRating != selectedRating;
  }
}

class _FilterChipsRow extends StatelessWidget {
  const _FilterChipsRow({
    required this.onSelect,
    required this.backgroundColor,
    required this.selectedRating,
  });

  final ValueChanged<double?> onSelect;
  final Color backgroundColor;
  final double? selectedRating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filters = <double?>[null, 5, 4, 3, 2, 1];

    return Container(
      color: backgroundColor,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (context, index) => hGap(8),
        itemBuilder: (context, index) {
          final rating = filters[index];
          final isSelected = rating == selectedRating;
          final label =
              rating == null ? S.of(context).all : '${rating.toInt()} ★';

          return ChoiceChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (_) => onSelect(rating),
            labelStyle: theme.textTheme.bodySmall?.copyWith(
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSurface,
            ),
            selectedColor: theme.colorScheme.primary,
            backgroundColor: theme.colorScheme.surface,
            side: BorderSide(color: theme.colorScheme.outline),
          );
        },
      ),
    );
  }
}