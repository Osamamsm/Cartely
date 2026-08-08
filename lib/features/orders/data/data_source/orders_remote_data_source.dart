import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/orders/data/model/order_details_model.dart';
import 'package:e_commerce/features/orders/data/model/order_model.dart';
import 'package:injectable/injectable.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<OrderDetailsModel> getOrderDetailsById(String id);
}

@LazySingleton(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {

  final SupabaseService _supabaseService;

  OrdersRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<OrderDetailsModel> getOrderDetailsById(String id) {
    // TODO: implement getOrderDetailsById
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}
