import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/orders/domain/entity/order_details.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<Order>>> getOrders();
  Future<Either<Failure, OrderDetails>> getOrderDetailsById(String id);
}