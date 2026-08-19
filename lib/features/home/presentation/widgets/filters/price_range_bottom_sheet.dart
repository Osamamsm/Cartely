import 'package:e_commerce/features/home/presentation/widgets/filters/price_label.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/sheet_button.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/sheet_handle.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class PriceRangeBottomSheet extends StatefulWidget {
  final double maxPrice;
  final RangeValues? currentRange;
  final void Function(RangeValues range) onApplied;
  final VoidCallback onCleared;

  const PriceRangeBottomSheet({
    super.key,
    required this.maxPrice,
    required this.currentRange,
    required this.onApplied,
    required this.onCleared,
  });

  @override
  State<PriceRangeBottomSheet> createState() => _PriceRangeBottomSheetState();
}

class _PriceRangeBottomSheetState extends State<PriceRangeBottomSheet> {
  late RangeValues _range;

  @override
  void initState() {
    super.initState();
    _range = widget.currentRange ?? RangeValues(0, widget.maxPrice);
  }

  String _fmt(double value) => '\$${value.toInt()}';

  @override
  Widget build(BuildContext context) {
    final bool isDirty = _range.start != 0 || _range.end != widget.maxPrice;
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
              S.of(context).priceRange,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceLabel(title: S.of(context).min, value: _fmt(_range.start)),
                PriceLabel(
                  title: S.of(context).max,
                  value: _range.end >= widget.maxPrice
                      ? '${_fmt(widget.maxPrice)}+'
                      : _fmt(_range.end),
                  alignRight: true,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: primary,
                inactiveTrackColor: Colors.white12,
                thumbColor: Colors.white,
                overlayColor: primary.withValues(alpha: 0.2),
                rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
                trackHeight: 4,
                overlappingShapeStrokeColor: primary,
              ),
              child: RangeSlider(
                values: _range,
                min: 0,
                max: widget.maxPrice,
                divisions: (widget.maxPrice / 10).round(),
                onChanged: (v) => setState(() => _range = v),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_fmt(0), style: const TextStyle(color: Colors.white30, fontSize: 11)),
                Text('${_fmt(widget.maxPrice)}+', style: const TextStyle(color: Colors.white30, fontSize: 11)),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                if (widget.currentRange != null) ...[
                  Expanded(
                    child: SheetOutlineButton(label: S.of(context).clear, onTap: widget.onCleared),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  flex: 2,
                  child: SheetFilledButton(
                    label: S.of(context).apply,
                    enabled: isDirty,
                    onTap: isDirty ? () => widget.onApplied(_range) : null,
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