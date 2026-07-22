import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';

abstract class CartRepo {
  Either<Failure, CartOperationResult> addToCart(
    String productId,
    int quantity,
  );
  Either<Failure, CartOperationResult> removeFromCart(String productId);
  Either<Failure, CartOperationResult> updateCartItem(
    String productId,
    int quantity,
  );
  Either<Failure, List<CartItem>> getCartItems();
  Either<Failure, CartOperationResult> clearCart();
}
