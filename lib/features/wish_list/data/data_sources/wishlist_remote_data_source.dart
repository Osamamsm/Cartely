import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:injectable/injectable.dart';

abstract class WishlistRemoteDataSource {
  Future<void> addToWishList(String productId);
  Future<void> removeFromWishList(String productId);
  Future<List<Product>> getWishList({required int page});
  Future<List<String>> getWishlistIds();
}

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final SupabaseService _supabaseService;

  WishlistRemoteDataSourceImpl(this._supabaseService);

  @override
  Future<void> addToWishList(String productId) async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    return await _supabaseService.from('wishlist').insert({
      'user_id': currentUser.id,
      'product_id': productId,
    });
  }

  @override
  Future<List<Product>> getWishList({required int page}) async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }
    final List<dynamic> response = await _supabaseService.rpc(
      function: 'get_wishlist',
      params: {'p_user_id': currentUser.id, 'p_page': page},
    );
    final List<Product> products = response
        .map((row) => Product.fromSupabaseRow(row))
        .toList();
    return products;
  }

  @override
  Future<void> removeFromWishList(String productId) async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    return await _supabaseService
        .from('wishlist')
        .delete()
        .eq('user_id', currentUser.id)
        .eq('product_id', productId);
  }

  @override
  Future<List<String>> getWishlistIds() async {
    final currentUser = _supabaseService.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    final response = await _supabaseService.rpc(
      function: 'get_wishlist_ids',
      params: {'p_user_id': currentUser.id},
    );

    final ids = (response as List)
        .map((item) => item['product_id'] as String)
        .toList();

    return ids;
  }
}
