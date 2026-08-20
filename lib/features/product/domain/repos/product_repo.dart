import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/data/models/products_query_params.dart';
import 'package:e_commerce/features/product/data/models/promotion.dart';
abstract class ProductRepo {
  Future<Either<Failure, List<Product>>> getProducts(ProductsQueryParams params);
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, ProductDetails>> getProductDetails(String productId);
  Future<Either<Failure, List<Product>>> getProductsByCategory({required String categoryId,required int page});
  Future<Either<Failure, List<Product>>> searchProducts({required String query,required int page});
  Future<Either<Failure, List<Promotion>>> getPromotions();
}
