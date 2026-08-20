import 'package:e_commerce/features/product/data/models/product.dart';

class ProductSearchState {
  final List<Product> products;
  final String? query;
  final ProductsStatus status;
  final bool isLoadingMore;
  final bool hasMore;
  final String errMessage;

  const ProductSearchState({
    this.products = const [],
    this.query ,
    this.status = ProductsStatus.initial,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.errMessage = "",
  });

  ProductSearchState copyWith({
    List<Product>? products,
    String? query,
    ProductsStatus? status,
    bool? isLoadingMore,
    bool? hasMore,
    String? errMessage,
  }) {
    return ProductSearchState(
      products: products ?? this.products,
      query : query ?? this.query,
      status: status ?? this.status,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}

enum ProductsStatus { initial, loading, loaded, failed }
