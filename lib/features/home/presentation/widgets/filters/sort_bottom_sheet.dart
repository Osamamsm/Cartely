import 'package:e_commerce/features/home/presentation/widgets/filters/product_filter_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/sheet_handle.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SortBottomSheet extends StatelessWidget {
  final SortOption current;
  final void Function(SortOption) onSelected;

  const SortBottomSheet({super.key, required this.current, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          const SheetHandle(),
          const SizedBox(height: 16),
          Text(
            S.of(context).sortBy,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...SortOption.values.map((option) {
            final isSelected = option == current;
            return ListTile(
              leading: Icon(option.icon, color: isSelected ? primary : Colors.white54, size: 20),
              title: Text(
                option.localizedLabel(context),
                style: TextStyle(
                  color: isSelected ? primary : Colors.white,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              trailing: isSelected ? Icon(Icons.check_rounded, color: primary, size: 18) : null,
              onTap: () => onSelected(option),
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}