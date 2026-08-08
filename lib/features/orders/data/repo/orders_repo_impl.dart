import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:e_commerce/features/orders/domain/entity/order_details.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart' hide Order;

@LazySingleton(as: OrdersRepo)
class OrderRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  OrderRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, OrderDetails>> getOrderDetailsById(String id) {
    // TODO: implement getOrderDetailsById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Order>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}
