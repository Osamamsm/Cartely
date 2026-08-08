import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/orders/data/model/order_details_model.dart';
import 'package:e_commerce/features/orders/data/model/order_model.dart';
import 'package:injectable/injectable.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<OrderDetailsModel> getOrderDetailsById({required String orderId});
}

@LazySingleton(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final SupabaseService _supabaseService;

  OrdersRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<OrderDetailsModel> getOrderDetailsById({required String orderId}) async {
    final response = await _supabaseService.rpc(
      function: 'get_order_by_id',
      params: {'p_order_id': orderId},
    );
    final orderDetails = OrderDetailsModel.fromJson(
      response as Map<String, dynamic>,
    );
    return orderDetails;
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await _supabaseService.rpc(function: 'get_user_orders');
    final List<OrderModel> orders = (response as List<dynamic>)
        .map((order) => OrderModel.fromJson(order as Map<String, dynamic>))
        .toList();
    return orders;
  }
}
