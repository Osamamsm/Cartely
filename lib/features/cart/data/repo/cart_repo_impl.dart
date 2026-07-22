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
    String productId,
    int quantity,
  ) async {
    try {
      final result = await _cartRemoteDataSource.addCartItem(
        productId,
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
    String productId,
  ) async {
    try {
      final result = await _cartRemoteDataSource.removeCartItem(productId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, CartOperationResult>> updateCartItem(
    String productId,
    int quantity,
  ) async {
    try {
      final result = await _cartRemoteDataSource.updateCartItem(productId, quantity);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
