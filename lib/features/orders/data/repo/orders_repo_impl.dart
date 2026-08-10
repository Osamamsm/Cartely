import 'package:dartz/dartz.dart' hide Order;
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/features/orders/domain/entity/order_details.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart' hide Order;

@LazySingleton(as: OrdersRepo)
class OrderRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  OrderRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, OrderDetails>> getOrderDetailsById({
    required String orderId,
  }) async {
    try {
      final orderDetails = await _remoteDataSource.getOrderDetailsById(
        orderId: orderId,
      );
      return Right(orderDetails.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getOrders({
    String? orderStatusFilter,
    String? searchQuery,
  }) async {
    try {
      final orders = await _remoteDataSource.getOrders(
        orderStatusFilter: orderStatusFilter,
        searchQuery: searchQuery,
      );
      return Right(orders.map((order) => order.toEntity()).toList());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
