import 'package:e_commerce/features/home/presentation/widgets/filters/product_filter_state.dart';

class ProductsQueryParams {
  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final bool inStockOnly;
  final bool onSaleOnly;
  final double? minRating;
  final String sortBy;
  final int limit;
  final int page;

  const ProductsQueryParams({
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.inStockOnly = false,
    this.onSaleOnly = false,
    this.minRating,
    this.sortBy = 'newest',
    this.limit = 20,
    required this.page,
  });

  factory ProductsQueryParams.fromFilterState(
    ProductFilterState filters, {
    String? categoryId,
    int limit = 10,
    required int page,
  }) {
    return ProductsQueryParams(
      categoryId: categoryId,
      minPrice: filters.priceRange?.start,
      maxPrice: filters.priceRange?.end,
      onSaleOnly: filters.onSaleOnly,
      inStockOnly: filters.inStockOnly,
      minRating: filters.minRating,
      sortBy: _sortOptionToString(filters.sortBy),
      limit: limit,
      page: page,
    );
  }

  factory ProductsQueryParams.initial() {
    return ProductsQueryParams(page: 1);
  }

  ProductsQueryParams copyWith({
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    bool? inStockOnly,
    bool? onSaleOnly,
    double? minRating,
    String? sortBy,
    int? limit,
    int? page,
  }) {
    return ProductsQueryParams(
      categoryId: categoryId ?? this.categoryId,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      inStockOnly: inStockOnly ?? this.inStockOnly,
      onSaleOnly: onSaleOnly ?? this.onSaleOnly,
      minRating: minRating ?? this.minRating,
      sortBy: sortBy ?? this.sortBy,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }

  static String _sortOptionToString(SortOption option) {
    switch (option) {
      case SortOption.newest:
        return 'newest';
      case SortOption.priceAsc:
        return 'price_asc';
      case SortOption.priceDesc:
        return 'price_desc';
      case SortOption.rating:
        return 'top_rated';
      case SortOption.popular:
        return 'popular';
    }
  }
}
