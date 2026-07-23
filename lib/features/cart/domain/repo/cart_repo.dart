import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';

abstract class CartRepo {
  Future<Either<Failure, CartOperationResult>> addToCart(
    String productItemId,
    int quantity,
  );
  Future<Either<Failure, CartOperationResult>> removeFromCart(
    String productItemId,
  );
  Future<Either<Failure, CartOperationResult>> updateCartItem(
    String productItemId,
    int quantity,
  );
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, CartOperationResult>> clearCart();
}
