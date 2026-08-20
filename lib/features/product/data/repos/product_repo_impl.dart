import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/product/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/data/models/products_query_params.dart';
import 'package:e_commerce/features/product/data/models/promotion.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails(
    String productId,
  ) async {
    try {
      final details = await _remoteDataSource.getProductDetails(productId);
      return Right(details);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(
    ProductsQueryParams params,
  ) async {
    try {
      final products = await _remoteDataSource.getProducts(params);
      return Right(products);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(
    {required String categoryId,required int page}
  ) async {
    try {
      final products = await _remoteDataSource.getProductsByCategory(
        categoryId: categoryId,
        page: page
      );
      return Right(products);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    try {
      final products = await _remoteDataSource.searchProducts(query);
      return Right(products);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Promotion>>> getPromotions() async {
    try {
      final promotions = await _remoteDataSource.getPromotions();
      return Right(promotions);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
