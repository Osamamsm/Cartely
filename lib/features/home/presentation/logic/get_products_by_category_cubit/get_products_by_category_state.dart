import 'package:e_commerce/features/product/data/models/product.dart';

class GetProductsByCategoryState {
  final List<Product> products;
  final String? categoryId;
  final ProductsStatus status;
  final bool isLoadingMore;
  final bool hasMore;
  final String errMessage;

  const GetProductsByCategoryState({
    this.products = const [],
    this.categoryId,
    this.status = ProductsStatus.initial,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.errMessage = "",
  });

  GetProductsByCategoryState copyWith({
    List<Product>? products,
    String? categoryId,
    ProductsStatus? status,
    bool? isLoadingMore,
    bool? hasMore,
    String? errMessage,
  }) {
    return GetProductsByCategoryState(
      products: products ?? this.products,
      categoryId: categoryId ?? this.categoryId,
      status: status ?? this.status,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}

enum ProductsStatus { initial, loading, loaded, failed }
