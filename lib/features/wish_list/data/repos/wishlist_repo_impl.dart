import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/wish_list/data/data_sources/wishlist_remote_data_source.dart';
import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishListRepo)
class WishlistRepoImpl implements WishListRepo {
  final WishlistRemoteDataSource _remoteDataSource;

  WishlistRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, void>> addToWishList(String productId) async {
    try {
      await _remoteDataSource.addToWishList(productId);
      return Right(null);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getWishList({
    required int page,
  }) async {
    try {
      final products = await _remoteDataSource.getWishList(page: page);
      return Right(products);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromWishList(String productId) async {
    try {
      await _remoteDataSource.removeFromWishList(productId);
      return Right(null);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getWishlistIds() async {
    try {
      final ids = await _remoteDataSource.getWishlistIds();
      return Right(ids);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
