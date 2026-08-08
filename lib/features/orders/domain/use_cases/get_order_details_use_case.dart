import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/orders/domain/entity/order_details.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderDetailsUseCase {
  final OrdersRepo _ordersRepo;

  GetOrderDetailsUseCase(this._ordersRepo);

  Future<Either<Failure, OrderDetails>> call({required String orderId}) async {
    return await _ordersRepo.getOrderDetailsById(orderId: orderId);
  }
}
