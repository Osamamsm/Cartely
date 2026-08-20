import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/product/data/models/product.dart';

abstract class WishListRepo {
  Future<Either<Failure, void>> addToWishList(String productId);
  Future<Either<Failure, void>> removeFromWishList(String productId);
  Future<Either<Failure, List<Product>>> getWishList({required int page});
  Future<Either<Failure, List<String>>> getWishlistIds();
}
