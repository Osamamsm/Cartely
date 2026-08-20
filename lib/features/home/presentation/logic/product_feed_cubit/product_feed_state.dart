import 'package:e_commerce/features/product/data/models/product.dart';

class ProductFeedState {
  final List<Product> products;
  final ProductsStatus status;
  final bool isLoadingMore;
  final bool hasMore;
  final String errMessage;

  const ProductFeedState({
    this.products = const [],
    this.status = ProductsStatus.initial,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.errMessage = "",
  });

  ProductFeedState copyWith({
    List<Product>? products,
    ProductsStatus? status,
    bool? isLoadingMore,
    bool? hasMore,
    String? errMessage,
  }) {
    return ProductFeedState(
      products: products ?? this.products,
      status: status ?? this.status,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}

enum ProductsStatus { initial, loading, loaded, failed }
