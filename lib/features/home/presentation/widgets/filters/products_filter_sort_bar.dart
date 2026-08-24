import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/clear_chip.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/filter_chip_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/price_range_bottom_sheet.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/product_filter_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/rating_bottom_sheet.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/sort_bottom_sheet.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/sort_chip.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsFilterSortBar extends StatefulWidget {
  final double maxPrice;
  const ProductsFilterSortBar({super.key, this.maxPrice = 500});

  @override
  State<ProductsFilterSortBar> createState() => _ProductsFilterSortBarState();
}

class _ProductsFilterSortBarState extends State<ProductsFilterSortBar> {
  ProductFilterState _filters = const ProductFilterState();

  void _apply(ProductFilterState updated) {
    setState(() => _filters = updated);
    context.read<ProductFeedCubit>().setFilters(updated);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SortChip(
            currentSort: _filters.sortBy,
            onTap: () => _showSortSheet(context),
          ),
          const SizedBox(width: 8),
          FilterChipWidget(
            label: S.of(context).onSale,
            icon: Icons.local_offer_outlined,
            isActive: _filters.onSaleOnly,
            onTap: () =>
                _apply(_filters.copyWith(onSaleOnly: !_filters.onSaleOnly)),
          ),
          hGap(8),
          FilterChipWidget(
            label: S.of(context).inStock,
            icon: Icons.inventory_2_outlined,
            isActive: _filters.inStockOnly,
            onTap: () =>
                _apply(_filters.copyWith(inStockOnly: !_filters.inStockOnly)),
          ),
          hGap(8),
          FilterChipWidget(
            label: _filters.minRating != null
                ? S
                      .of(context)
                      .ratingAndUp(_filters.minRating!.toStringAsFixed(0))
                : S.of(context).rating,
            icon: Icons.star_outline,
            isActive: _filters.minRating != null,
            onTap: () => _showRatingSheet(context),
          ),
          hGap(8),
          FilterChipWidget(
            label: _filters.priceRange != null
                ? '${_filters.priceRange!.start.toInt()}–${_filters.priceRange!.end.toInt()} ${S.of(context).egp}'
                : S.of(context).price,
            icon: Icons.attach_money,
            isActive: _filters.priceRange != null,
            onTap: () => _showPriceSheet(context),
          ),
          if (_filters.hasActiveFilters) ...[
            hGap(8),
            ClearChip(onTap: () => _apply(_filters.clearFilters())),
          ],
        ],
      ),
    );
  }

  Future<void> _showFilterSheet(
    WidgetBuilder builder, {
    bool isScrollControlled = false,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      isScrollControlled: isScrollControlled,
      builder: builder,
    );
  }

  void _showSortSheet(BuildContext context) {
    _showFilterSheet(
      (_) => SortBottomSheet(
        current: _filters.sortBy,
        onSelected: (selected) {
          Navigator.pop(context);
          _apply(_filters.copyWith(sortBy: selected));
        },
      ),
    );
  }

  void _showRatingSheet(BuildContext context) {
    _showFilterSheet(
      (_) => RatingBottomSheet(
        currentRating: _filters.minRating,
        onSelected: (rating) {
          Navigator.pop(context);
          _apply(_filters.copyWith(minRating: rating));
        },
        onCleared: () {
          Navigator.pop(context);
          _apply(_filters.copyWith(clearMinRating: true));
        },
      ),
    );
  }

  void _showPriceSheet(BuildContext context) {
    _showFilterSheet(
      (_) => PriceRangeBottomSheet(
        maxPrice: widget.maxPrice,
        currentRange: _filters.priceRange,
        onApplied: (range) {
          Navigator.pop(context);
          _apply(_filters.copyWith(priceRange: range));
        },
        onCleared: () {
          Navigator.pop(context);
          _apply(_filters.copyWith(clearPriceRange: true));
        },
      ),
      isScrollControlled: true,
    );
  }
}
