import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _cartRemoteDataSource;
  CartRepoImpl(this._cartRemoteDataSource);

  @override
  Future<Either<Failure, CartOperationResult>> addToCart(
    String productItemId,
    int quantity,
  ) async {
    try {
      final result = await _cartRemoteDataSource.addToCart(
        productItemId,
        quantity,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CartOperationResult>> clearCart() async {
    try {
      final result = await _cartRemoteDataSource.clearCart();
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems() async {
    try {
      final result = await _cartRemoteDataSource.getCartItems();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CartOperationResult>> removeFromCart(
    String productItemId,
  ) async {
    try {
      final result = await _cartRemoteDataSource.removeCartItem(productItemId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CartOperationResult>> updateCartItem(
    String productItemId,
    int newQuantity,
  ) async {
    try {
      final result = await _cartRemoteDataSource.updateCartItem(
        productItemId,
        newQuantity,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
