import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart';

@injectable
class GetCartItemsUseCase {
  final CartRepo _cartRepo;
  GetCartItemsUseCase(this._cartRepo);

  Future<Either<Failure, List<CartItem>>> call() {
    return _cartRepo.getCartItems();
  }
}
