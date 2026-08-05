import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/checkout/data/model/place_order_result_model.dart';
import 'package:injectable/injectable.dart';


abstract class CheckoutRemoteDataSource {
  Future<PlaceOrderResultModel> placeOrderCashOnDelivery({
    required String addressId,
  });
}

@LazySingleton(as: CheckoutRemoteDataSource)
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final SupabaseService _supabaseService;

  CheckoutRemoteDataSourceImpl(this._supabaseService);
  @override
  Future<PlaceOrderResultModel> placeOrderCashOnDelivery({
    required String addressId,
  }) async {
    final response = await _supabaseService.rpc(
      function: 'place_order_cod',
      params: {'p_address_id': addressId},
    );

    return PlaceOrderResultModel.fromJson(response);
  }
}
