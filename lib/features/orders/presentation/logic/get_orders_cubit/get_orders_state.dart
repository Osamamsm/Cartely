import 'package:e_commerce/features/orders/domain/entity/order.dart';

class GetOrdersState {}

class GetOrdersInitial extends GetOrdersState {}

class GetOrdersLoading extends GetOrdersState {}

class GetOrdersSuccess extends GetOrdersState {
  final List<Order> orders;

  GetOrdersSuccess({required this.orders});
}

class GetOrdersFailure extends GetOrdersState {
  final String message;

  GetOrdersFailure({required this.message});
}
