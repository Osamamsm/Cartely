import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';

@injectable
class RemoveFromCartUseCase {
  final CartRepo _cartRepo;
  RemoveFromCartUseCase(this._cartRepo);

  Future<Either<Failure, CartOperationResult>> call(String cartItemId) {
    return _cartRepo.removeFromCart(cartItemId);
  }
}
