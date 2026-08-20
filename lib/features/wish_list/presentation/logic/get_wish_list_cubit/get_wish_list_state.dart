import 'package:e_commerce/features/product/data/models/product.dart';

class GetWishlistState {
  final List<Product> products;
  final WishlistStatus status;
  final bool isLoadingMore;
  final bool hasMore;
  final String errMessage;

  const GetWishlistState({
    this.products = const [],
    this.status = WishlistStatus.initial,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.errMessage = "",
  });

  GetWishlistState copyWith({
    List<Product>? products,
    WishlistStatus? status,
    bool? isLoadingMore,
    bool? hasMore,
    String? errMessage,
  }) {
    return GetWishlistState(
      products: products ?? this.products,
      status: status ?? this.status,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}

enum WishlistStatus { initial, loading, loaded, failed }
