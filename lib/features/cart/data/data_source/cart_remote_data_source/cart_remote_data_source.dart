import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/data/models/cart_operation_result_model.dart';
import 'package:injectable/injectable.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<CartOperationResultModel> addToCart(
    String productItemId,
    int quantity,
  );
  Future<CartOperationResultModel> updateCartItem(
    String productItemId,
    int newQuantity,
  );
  Future<CartOperationResultModel> removeCartItem(String productItemId);
  Future<CartOperationResultModel> clearCart();
}

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final SupabaseService _supabaseService;

  CartRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<CartOperationResultModel> addToCart(
    String productItemId,
    int quantity,
  ) async {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _supabaseService.rpc(
      function: 'add_to_cart',
      params: {
        'p_user_id': user.id,
        'p_product_item_id': productItemId,
        'p_quantity': quantity,
      },
    );
    return CartOperationResultModel.fromJson(response);
  }

  @override
  Future<CartOperationResultModel> clearCart() async {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _supabaseService.rpc(
      function: 'clear_cart',
      params: {'p_user_id': user.id},
    );
    return CartOperationResultModel.fromJson(response);
  }

  @override
  Future<CartModel> getCart() async {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _supabaseService.rpc(
      function: 'get_cart_items',
      params: {'p_user_id': user.id},
    );
    return CartModel.fromJson(response);
  }

  @override
  Future<CartOperationResultModel> removeCartItem(String productItemId) async {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _supabaseService.rpc(
      function: 'remove_cart_item',
      params: {'p_user_id': user.id, 'p_product_item_id': productItemId},
    );
    return CartOperationResultModel.fromJson(response);
  }

  @override
  Future<CartOperationResultModel> updateCartItem(
    String productItemId,
    int newQuantity,
  ) async {
    final user = _supabaseService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    final response = await _supabaseService.rpc(
      function: 'update_cart_item',
      params: {
        'p_user_id': user.id,
        'p_product_item_id': productItemId,
        'p_new_quantity': newQuantity,
      },
    );
    return CartOperationResultModel.fromJson(response);
  }
}
