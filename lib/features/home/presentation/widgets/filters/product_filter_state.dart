import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

enum SortOption {
  newest('Newest', Icons.fiber_new_outlined),
  priceAsc('Price: Low–High', Icons.arrow_upward),
  priceDesc('Price: High–Low', Icons.arrow_downward),
  rating('Top Rated', Icons.star_outline),
  popular('Most Popular', Icons.local_fire_department_outlined);

  final String label;
  final IconData icon;
  const SortOption(this.label, this.icon);

  String localizedLabel(BuildContext context) {
    final s = S.of(context);
    return switch (this) {
      SortOption.newest => s.sortNewest,
      SortOption.priceAsc => s.sortPriceLowHigh,
      SortOption.priceDesc => s.sortPriceHighLow,
      SortOption.rating => s.sortTopRated,
      SortOption.popular => s.sortMostPopular,
    };
  }

  String localizedShortLabel(BuildContext context) {
    final label = localizedLabel(context);
    return label.contains(':') ? label.split(':').first : label;
  }
}

class ProductFilterState {
  final SortOption sortBy;
  final bool onSaleOnly;
  final bool inStockOnly;
  final double? minRating;
  final RangeValues? priceRange;

  const ProductFilterState({
    this.sortBy = SortOption.newest,
    this.onSaleOnly = false,
    this.inStockOnly = false,
    this.minRating,
    this.priceRange,
  });

  bool get hasActiveFilters =>
      onSaleOnly || inStockOnly || minRating != null || priceRange != null;

  ProductFilterState copyWith({
    SortOption? sortBy,
    bool? onSaleOnly,
    bool? inStockOnly,
    double? minRating,
    RangeValues? priceRange,
    bool clearMinRating = false,
    bool clearPriceRange = false,
  }) {
    return ProductFilterState(
      sortBy: sortBy ?? this.sortBy,
      onSaleOnly: onSaleOnly ?? this.onSaleOnly,
      inStockOnly: inStockOnly ?? this.inStockOnly,
      minRating: clearMinRating ? null : (minRating ?? this.minRating),
      priceRange: clearPriceRange ? null : (priceRange ?? this.priceRange),
    );
  }

  ProductFilterState clearFilters() => ProductFilterState(sortBy: sortBy);
}