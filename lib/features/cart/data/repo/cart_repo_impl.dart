import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
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
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final result = await _cartRemoteDataSource.getCart();
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CartOperationResult>> removeFromCart(
    String cartItemId,
  ) async {
    try {
      final result = await _cartRemoteDataSource.removeCartItem(cartItemId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CartOperationResult>> updateCartItem(
    String cartItemId,
    int newQuantity,
  ) async {
    try {
      final result = await _cartRemoteDataSource.updateCartItem(
        cartItemId,
        newQuantity,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
