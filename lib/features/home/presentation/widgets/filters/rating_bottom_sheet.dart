import 'package:e_commerce/features/home/presentation/widgets/filters/sheet_button.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/sheet_handle.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class RatingBottomSheet extends StatefulWidget {
  final double? currentRating;
  final void Function(double rating) onSelected;
  final VoidCallback onCleared;

  const RatingBottomSheet({
    super.key,
    required this.currentRating,
    required this.onSelected,
    required this.onCleared,
  });

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  double? _selected;

  static const _starColor = Color(0xFFFBBF24);
  static const _options = [1.0, 2.0, 3.0, 4.0];

  @override
  void initState() {
    super.initState();
    _selected = widget.currentRating;
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SheetHandle(),
            const SizedBox(height: 20),
            Text(
              S.of(context).minimumRating,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              S.of(context).showProductsRatedAtLeast,
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _options.map((rating) {
                final isSelected = _selected == rating;
                return GestureDetector(
                  onTap: () => setState(() => _selected = rating),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 72,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? primary : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: isSelected ? primary : Colors.white12, width: 1.5),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: primary.withValues(alpha: 0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            rating.toInt(),
                            (_) => const Icon(Icons.star_rounded, color: _starColor, size: 13),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          S.of(context).ratingAndUp(rating.toInt().toString()),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white60,
                            fontSize: 11,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                if (widget.currentRating != null) ...[
                  Expanded(
                    child: SheetOutlineButton(label: S.of(context).clear, onTap: widget.onCleared),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  flex: 2,
                  child: SheetFilledButton(
                    label: S.of(context).apply,
                    enabled: _selected != null,
                    onTap: _selected != null ? () => widget.onSelected(_selected!) : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}