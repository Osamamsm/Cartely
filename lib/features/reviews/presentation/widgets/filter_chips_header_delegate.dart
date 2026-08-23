import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class FilterChipsHeaderDelegate extends SliverPersistentHeaderDelegate {
  FilterChipsHeaderDelegate({
    required this.onSelect,
    required this.backgroundColor,
  });

  final ValueChanged<double?> onSelect;
  final Color backgroundColor;

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
    );
  }

  @override
  bool shouldRebuild(covariant FilterChipsHeaderDelegate oldDelegate) {
    return oldDelegate.backgroundColor != backgroundColor;
  }
}

class _FilterChipsRow extends StatefulWidget {
  const _FilterChipsRow({
    required this.onSelect,
    required this.backgroundColor,
  });

  final ValueChanged<double?> onSelect;
  final Color backgroundColor;

  @override
  State<_FilterChipsRow> createState() => _FilterChipsRowState();
}

class _FilterChipsRowState extends State<_FilterChipsRow> {
  double? _selectedRating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filters = <double?>[null, 5, 4, 3, 2, 1];

    return Container(
      color: widget.backgroundColor,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (context, index) => hGap(8),
        itemBuilder: (context, index) {
          final rating = filters[index];
          final isSelected = rating == _selectedRating;
          final label =
              rating == null ? S.of(context).all : '${rating.toInt()} ★';

          return ChoiceChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (_) {
              setState(() => _selectedRating = rating);
              widget.onSelect(rating);
            },
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