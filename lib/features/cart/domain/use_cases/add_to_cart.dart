import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_operation_result.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';

@injectable
class AddToCartUseCase {
  final CartRepo _cartRepo;
  AddToCartUseCase(this._cartRepo);

  Future<Either<Failure, CartOperationResult>> call({
    required String productItemId,
    required int quantity,
  }) {
    return _cartRepo.addToCart(productItemId, quantity);
  }
}
