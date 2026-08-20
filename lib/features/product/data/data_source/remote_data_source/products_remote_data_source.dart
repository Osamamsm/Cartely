import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/data/models/products_query_params.dart';
import 'package:e_commerce/features/product/data/models/promotion.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts(ProductsQueryParams params);
  Future<List<Category>> getCategories();
  Future<ProductDetails> getProductDetails(String productId);
  Future<List<Product>> getProductsByCategory({
    required String categoryId,
    required int page,
  });
  Future<List<Product>> searchProducts({
    required String query,
    required int page,
  });
  Future<List<Product>> getRelatedProducts(String productId);
  Future<List<Promotion>> getPromotions();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductSupabaseDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseService _service;

  ProductSupabaseDataSourceImpl(this._service);

  @override
  Future<List<Category>> getCategories() async {
    final List<dynamic> response = await _service.rpc(
      function: 'get_categories',
    );
    return response.map((row) => Category.fromSupabaseRow(row)).toList();
  }

  @override
  Future<ProductDetails> getProductDetails(String productId) async {
    final List<dynamic> response = await _service.rpc(
      function: 'get_product_details',
      params: {'p_product_id': productId},
    );
    return ProductDetails.fromJson(response.first);
  }

  @override
  Future<List<Product>> getProducts(ProductsQueryParams params) async {
    final List<dynamic> response = await _service.rpc(
      function: 'get_products',
      params: {
        'p_category_id': params.categoryId,
        'p_min_price': params.minPrice,
        'p_max_price': params.maxPrice,
        'p_in_stock_only': params.inStockOnly,
        'p_sort_by': params.sortBy.toString().split('.').last,
        'p_on_sale_only': params.onSaleOnly,
        'p_min_rating': params.minRating,
        'p_page': params.page,
        'p_limit': params.limit,
      },
    );
    final List<Product> products = response
        .map((row) => Product.fromSupabaseRow(row))
        .toList();
    return products;
  }

  @override
  Future<List<Product>> getProductsByCategory({
    required String categoryId,
    required int page,
  }) async {
    final List<dynamic> response = await _service.rpc(
      function: 'get_products',
      params: {'p_category_id': categoryId, 'p_page': page},
    );
    return response.map((row) => Product.fromSupabaseRow(row)).toList();
  }

  @override
  Future<List<Product>> getRelatedProducts(String productId) {
    // TODO: implement getRelatedProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> searchProducts({
    required String query,
    required int page,
  }) async {
    final List<dynamic> response = await _service.rpc(
      function: 'search_products',
      params: {'p_search_term': query, 'p_page': page},
    );
    final List<Product> products = response
        .map((row) => Product.fromSupabaseRow(row))
        .toList();
    return products;
  }

  @override
  Future<List<Promotion>> getPromotions() async {
    final List<dynamic> response = await _service.rpc(
      function: 'get_promotions',
      params: {},
    );
    final List<Promotion> promotions = response
        .map((row) => Promotion.fromJson(row))
        .toList();
    return promotions;
  }
}
