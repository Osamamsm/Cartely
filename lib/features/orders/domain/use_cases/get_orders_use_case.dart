import 'package:dartz/dartz.dart' hide Order;
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart' hide Order;

@injectable
class GetOrdersUseCase {
  final OrdersRepo _ordersRepo;

  GetOrdersUseCase(this._ordersRepo);

  Future<Either<Failure, List<Order>>> call({String? orderStatusFilter}) async {
    return await _ordersRepo.getOrders(orderStatusFilter: orderStatusFilter);
  }
}
