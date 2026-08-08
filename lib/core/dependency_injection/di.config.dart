// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/core/logic/deep_link_cubit/deep_link_cubit.dart'
    as _i457;
import 'package:e_commerce/core/logic/image_picker_cubit/image_picker_cubit.dart'
    as _i594;
import 'package:e_commerce/core/notifications_service/push_notifications_service.dart'
    as _i164;
import 'package:e_commerce/core/preferences/shared_preferences_module.dart'
    as _i459;
import 'package:e_commerce/core/preferences/user_preferences_helper.dart'
    as _i78;
import 'package:e_commerce/core/supabase/supabase_client.dart' as _i4;
import 'package:e_commerce/core/supabase/supabase_service.dart' as _i74;
import 'package:e_commerce/features/addresses/data/data_sources/address_remote_data_source.dart'
    as _i295;
import 'package:e_commerce/features/addresses/data/repos/address_repo_impl.dart'
    as _i920;
import 'package:e_commerce/features/addresses/domain/repos/address_repo.dart'
    as _i56;
import 'package:e_commerce/features/addresses/domain/use_cases/add_new_address_use_case.dart'
    as _i708;
import 'package:e_commerce/features/addresses/domain/use_cases/delete_address_use_case.dart'
    as _i991;
import 'package:e_commerce/features/addresses/domain/use_cases/get_addresses_use_case.dart'
    as _i298;
import 'package:e_commerce/features/addresses/domain/use_cases/set_default_address_use_case.dart'
    as _i811;
import 'package:e_commerce/features/addresses/domain/use_cases/update_address_use_case.dart'
    as _i886;
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart'
    as _i155;
import 'package:e_commerce/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i254;
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart'
    as _i562;
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart' as _i380;
import 'package:e_commerce/features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i841;
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart'
    as _i785;
import 'package:e_commerce/features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i817;
import 'package:e_commerce/features/auth/domain/use_cases/sign_out_use_case.dart'
    as _i956;
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart'
    as _i691;
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart'
    as _i756;
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart'
    as _i567;
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_cubit.dart'
    as _i635;
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart'
    as _i330;
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_cubit.dart'
    as _i167;
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart'
    as _i927;
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source/cart_remote_data_source.dart'
    as _i676;
import 'package:e_commerce/features/cart/data/repo/cart_repo_impl.dart'
    as _i197;
import 'package:e_commerce/features/cart/domain/repo/cart_repo.dart' as _i571;
import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart.dart'
    as _i615;
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart.dart'
    as _i943;
import 'package:e_commerce/features/cart/domain/use_cases/get_cart_items.dart'
    as _i163;
import 'package:e_commerce/features/cart/domain/use_cases/remove_from_cart.dart'
    as _i612;
import 'package:e_commerce/features/cart/domain/use_cases/update_cart_item.dart'
    as _i618;
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart'
    as _i325;
import 'package:e_commerce/features/checkout/data/data_source/checkout_remote_data_source.dart'
    as _i209;
import 'package:e_commerce/features/checkout/data/repo/checkout_repo_impl.dart'
    as _i254;
import 'package:e_commerce/features/checkout/domain/repo/checkout_repo.dart'
    as _i128;
import 'package:e_commerce/features/checkout/domain/use_cases/place_order_cash_on_delivery_use_case.dart'
    as _i719;
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart'
    as _i555;
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart'
    as _i517;
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_cubit.dart'
    as _i531;
import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_cubit.dart'
    as _i109;
import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_cubit.dart'
    as _i1036;
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart'
    as _i654;
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_cubit.dart'
    as _i831;
import 'package:e_commerce/features/notifications/logic/cubit/notifications_settings_cubit.dart'
    as _i382;
import 'package:e_commerce/features/orders/data/data_source/orders_remote_data_source.dart'
    as _i800;
import 'package:e_commerce/features/orders/data/repo/orders_repo_impl.dart'
    as _i139;
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart'
    as _i144;
import 'package:e_commerce/features/orders/domain/use_cases/get_order_details_use_case.dart'
    as _i279;
import 'package:e_commerce/features/orders/domain/use_cases/get_orders_use_case.dart'
    as _i594;
import 'package:e_commerce/features/orders/presentation/logic/get_order_details_cubit/get_order_details_cubit.dart'
    as _i165;
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_cubit.dart'
    as _i93;
import 'package:e_commerce/features/product/data/data_source/remote_data_source/products_remote_data_source.dart'
    as _i651;
import 'package:e_commerce/features/product/data/repos/product_repo_impl.dart'
    as _i977;
import 'package:e_commerce/features/product/domain/repos/product_repo.dart'
    as _i1005;
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart'
    as _i158;
import 'package:e_commerce/features/profile/data/data_source/profile_remote_data_source.dart'
    as _i1063;
import 'package:e_commerce/features/profile/data/repo/profile_repo_impl.dart'
    as _i22;
import 'package:e_commerce/features/profile/domain/repo/profile_repo.dart'
    as _i245;
import 'package:e_commerce/features/profile/domain/use_cases/get_profile_use_case.dart'
    as _i350;
import 'package:e_commerce/features/profile/domain/use_cases/update_profile_with_avatar_use_case.dart'
    as _i764;
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart'
    as _i725;
import 'package:e_commerce/features/settings/presentation/logic/cubit/app_settings_cubit.dart'
    as _i259;
import 'package:e_commerce/features/wish_list/data/data_sources/wishlist_remote_data_source.dart'
    as _i696;
import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart'
    as _i733;
import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo_impl.dart'
    as _i796;
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_cubit.dart'
    as _i699;
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_cubit.dart'
    as _i756;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final preferencesModule = _$PreferencesModule();
    final supabaseClientProvider = _$SupabaseClientProvider();
    gh.factory<_i594.ImagePickerCubit>(() => _i594.ImagePickerCubit());
    gh.factory<_i517.CheckoutFlowCubit>(() => _i517.CheckoutFlowCubit());
    gh.lazySingleton<_i457.DeepLinkCubit>(() => _i457.DeepLinkCubit());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => preferencesModule.preferences,
      preResolve: true,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseClientProvider.client);
    gh.lazySingleton<_i78.UserPreferencesHelper>(
      () => _i78.UserPreferencesHelper(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i74.SupabaseService>(
      () => _i74.SupabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i254.AuthRemoteDataSource>(
      () => _i254.AuthRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i1063.ProfileRemoteDataSource>(
      () => _i1063.ProfileRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i800.OrdersRemoteDataSource>(
      () => _i800.OrdersRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i676.CartRemoteDataSource>(
      () => _i676.CartRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i164.PushNotificationsService>(
      () => _i164.PushNotificationsService(gh<_i78.UserPreferencesHelper>()),
    );
    gh.factory<_i259.AppSettingsCubit>(
      () => _i259.AppSettingsCubit(gh<_i78.UserPreferencesHelper>()),
    );
    gh.lazySingleton<_i696.WishlistRemoteDataSource>(
      () => _i696.WishlistRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i295.AddressRemoteDataSource>(
      () => _i295.AddressRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i56.AddressRepo>(
      () => _i920.AddressRepoImpl(gh<_i295.AddressRemoteDataSource>()),
    );
    gh.lazySingleton<_i209.CheckoutRemoteDataSource>(
      () => _i209.CheckoutRemoteDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i128.CheckoutRepo>(
      () => _i254.CheckoutRepoImpl(gh<_i209.CheckoutRemoteDataSource>()),
    );
    gh.lazySingleton<_i651.ProductRemoteDataSource>(
      () => _i651.ProductSupabaseDataSourceImpl(gh<_i74.SupabaseService>()),
    );
    gh.lazySingleton<_i733.WishListRepo>(
      () => _i796.WishlistRepoImpl(gh<_i696.WishlistRemoteDataSource>()),
    );
    gh.lazySingleton<_i1005.ProductRepo>(
      () => _i977.ProductRepoImpl(gh<_i651.ProductRemoteDataSource>()),
    );
    gh.lazySingleton<_i144.OrdersRepo>(
      () => _i139.OrderRepoImpl(gh<_i800.OrdersRemoteDataSource>()),
    );
    gh.factory<_i279.GetOrderDetailsUseCase>(
      () => _i279.GetOrderDetailsUseCase(gh<_i144.OrdersRepo>()),
    );
    gh.factory<_i594.GetOrdersUseCase>(
      () => _i594.GetOrdersUseCase(gh<_i144.OrdersRepo>()),
    );
    gh.factory<_i382.NotificationsSettingsCubit>(
      () => _i382.NotificationsSettingsCubit(
        gh<_i164.PushNotificationsService>(),
      ),
    );
    gh.lazySingleton<_i380.AuthRepo>(
      () => _i562.AuthRepoImpl(gh<_i254.AuthRemoteDataSource>()),
    );
    gh.factory<_i719.PlaceOrderCashOnDeliveryUseCase>(
      () => _i719.PlaceOrderCashOnDeliveryUseCase(gh<_i128.CheckoutRepo>()),
    );
    gh.factory<_i756.WishlistCubit>(
      () => _i756.WishlistCubit(gh<_i733.WishListRepo>()),
    );
    gh.lazySingleton<_i245.ProfileRepo>(
      () => _i22.ProfileRepoImpl(gh<_i1063.ProfileRemoteDataSource>()),
    );
    gh.factory<_i699.GetWishListCubit>(
      () => _i699.GetWishListCubit(gh<_i733.WishListRepo>()),
    );
    gh.factory<_i165.GetOrderDetailsCubit>(
      () => _i165.GetOrderDetailsCubit(gh<_i279.GetOrderDetailsUseCase>()),
    );
    gh.lazySingleton<_i571.CartRepo>(
      () => _i197.CartRepoImpl(gh<_i676.CartRemoteDataSource>()),
    );
    gh.lazySingleton<_i756.AuthCubit>(
      () => _i756.AuthCubit(gh<_i74.SupabaseService>()),
    );
    gh.factory<_i708.AddNewAddressUseCase>(
      () => _i708.AddNewAddressUseCase(gh<_i56.AddressRepo>()),
    );
    gh.factory<_i991.DeleteAddressUseCase>(
      () => _i991.DeleteAddressUseCase(gh<_i56.AddressRepo>()),
    );
    gh.factory<_i298.GetAddressesUseCase>(
      () => _i298.GetAddressesUseCase(gh<_i56.AddressRepo>()),
    );
    gh.factory<_i811.SetDefaultAddressUseCase>(
      () => _i811.SetDefaultAddressUseCase(gh<_i56.AddressRepo>()),
    );
    gh.factory<_i886.UpdateAddressUseCase>(
      () => _i886.UpdateAddressUseCase(gh<_i56.AddressRepo>()),
    );
    gh.factory<_i350.GetProfileDataUseCase>(
      () => _i350.GetProfileDataUseCase(gh<_i245.ProfileRepo>()),
    );
    gh.factory<_i531.CategoriesCubit>(
      () => _i531.CategoriesCubit(gh<_i1005.ProductRepo>()),
    );
    gh.factory<_i109.GetProductsByCategoryCubit>(
      () => _i109.GetProductsByCategoryCubit(gh<_i1005.ProductRepo>()),
    );
    gh.factory<_i1036.GetPromotionsCubit>(
      () => _i1036.GetPromotionsCubit(gh<_i1005.ProductRepo>()),
    );
    gh.factory<_i654.ProductFeedCubit>(
      () => _i654.ProductFeedCubit(gh<_i1005.ProductRepo>()),
    );
    gh.factory<_i831.ProductSearchCubit>(
      () => _i831.ProductSearchCubit(gh<_i1005.ProductRepo>()),
    );
    gh.factory<_i158.ProductDetailsCubit>(
      () => _i158.ProductDetailsCubit(gh<_i1005.ProductRepo>()),
    );
    gh.factory<_i93.GetOrdersCubit>(
      () => _i93.GetOrdersCubit(gh<_i594.GetOrdersUseCase>()),
    );
    gh.factory<_i764.UpdateProfileWithAvatarUseCase>(
      () => _i764.UpdateProfileWithAvatarUseCase(gh<_i245.ProfileRepo>()),
    );
    gh.factory<_i817.ResetPasswordUseCase>(
      () => _i817.ResetPasswordUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i555.CheckoutCubit>(
      () => _i555.CheckoutCubit(gh<_i719.PlaceOrderCashOnDeliveryUseCase>()),
    );
    gh.factory<_i841.ForgotPasswordUseCase>(
      () => _i841.ForgotPasswordUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i785.LoginUseCase>(
      () => _i785.LoginUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i956.SignOutUseCase>(
      () => _i956.SignOutUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i691.SignUpUseCase>(
      () => _i691.SignUpUseCase(gh<_i380.AuthRepo>()),
    );
    gh.factory<_i615.AddToCartUseCase>(
      () => _i615.AddToCartUseCase(gh<_i571.CartRepo>()),
    );
    gh.factory<_i943.ClearCartUseCase>(
      () => _i943.ClearCartUseCase(gh<_i571.CartRepo>()),
    );
    gh.factory<_i163.GetCartItemsUseCase>(
      () => _i163.GetCartItemsUseCase(gh<_i571.CartRepo>()),
    );
    gh.factory<_i612.RemoveFromCartUseCase>(
      () => _i612.RemoveFromCartUseCase(gh<_i571.CartRepo>()),
    );
    gh.factory<_i618.UpdateCartItemUseCase>(
      () => _i618.UpdateCartItemUseCase(gh<_i571.CartRepo>()),
    );
    gh.factory<_i325.CartCubit>(
      () => _i325.CartCubit(
        gh<_i163.GetCartItemsUseCase>(),
        gh<_i943.ClearCartUseCase>(),
        gh<_i612.RemoveFromCartUseCase>(),
        gh<_i618.UpdateCartItemUseCase>(),
        gh<_i615.AddToCartUseCase>(),
      ),
    );
    gh.factory<_i330.ResetPasswordCubit>(
      () => _i330.ResetPasswordCubit(gh<_i817.ResetPasswordUseCase>()),
    );
    gh.factory<_i155.AddressesCubit>(
      () => _i155.AddressesCubit(
        gh<_i298.GetAddressesUseCase>(),
        gh<_i708.AddNewAddressUseCase>(),
        gh<_i991.DeleteAddressUseCase>(),
        gh<_i811.SetDefaultAddressUseCase>(),
        gh<_i886.UpdateAddressUseCase>(),
      ),
    );
    gh.factory<_i725.ProfileCubit>(
      () => _i725.ProfileCubit(
        gh<_i350.GetProfileDataUseCase>(),
        gh<_i764.UpdateProfileWithAvatarUseCase>(),
      ),
    );
    gh.factory<_i167.SignOutCubit>(
      () => _i167.SignOutCubit(gh<_i956.SignOutUseCase>()),
    );
    gh.factory<_i567.ForgotPasswordCubit>(
      () => _i567.ForgotPasswordCubit(gh<_i841.ForgotPasswordUseCase>()),
    );
    gh.factory<_i927.SignUpCubit>(
      () => _i927.SignUpCubit(gh<_i691.SignUpUseCase>()),
    );
    gh.factory<_i635.LogInCubit>(
      () => _i635.LogInCubit(gh<_i785.LoginUseCase>()),
    );
    return this;
  }
}

class _$PreferencesModule extends _i459.PreferencesModule {}

class _$SupabaseClientProvider extends _i4.SupabaseClientProvider {}
