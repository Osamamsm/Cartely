import 'package:e_commerce/features/orders/domain/entity/order_details.dart';

class GetOrderDetailsState {}

final class GetOrderDetailsInitial extends GetOrderDetailsState {}

final class GetOrderDetailsLoading extends GetOrderDetailsState {}

final class GetOrderDetailsFailure extends GetOrderDetailsState {
  final String message;
  GetOrderDetailsFailure({required this.message});
}

final class GetOrderDetailsSuccess extends GetOrderDetailsState {
  final OrderDetails orderDetails;
  GetOrderDetailsSuccess({required this.orderDetails});
}
