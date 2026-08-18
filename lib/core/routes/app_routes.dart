import 'dart:async';
import 'package:e_commerce/core/dependency_injection/di.dart';
import 'package:e_commerce/core/logic/image_picker_cubit/image_picker_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/views/add_address_view.dart';
import 'package:e_commerce/features/addresses/presentation/views/edit_address_view.dart';
import 'package:e_commerce/features/addresses/presentation/views/saved_addresses_view.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/register_view.dart';
import 'package:e_commerce/features/auth/presentation/views/reset_password_view.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/payment_confirmation_cubit/payment_confirmation_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/payment_confirmation_view.dart';
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/category_products_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/home/presentation/views/search_results_view.dart';
import 'package:e_commerce/features/notifications/logic/cubit/notifications_settings_cubit.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_order_details_cubit/get_order_details_cubit.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_commerce/features/orders/presentation/views/order_details_view.dart';
import 'package:e_commerce/features/orders/presentation/views/orders_view.dart';
import 'package:e_commerce/features/payment/presentation/views/add_payment_method_view.dart';
import 'package:e_commerce/features/payment/presentation/views/payment_methods_view.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/features/profile/presentation/views/edit_profile_view.dart';
import 'package:e_commerce/features/profile/presentation/views/personal_details_view.dart';
import 'package:e_commerce/features/profile/presentation/views/profile_view.dart';
import 'package:e_commerce/features/settings/presentation/views/settings_view.dart';
import 'package:e_commerce/features/splash/views/splash_view.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:e_commerce/features/wish_list/presentation/views/wish_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter(AuthCubit authCubit) {
  return GoRouter(
    initialLocation: SplashView.routeName,
    refreshListenable: GoRouterRefreshStream(authCubit),
    redirect: (context, state) {
      final authStatus = authCubit.state.status;
      final isOnAuthPage =
          state.matchedLocation == LoginView.routeName ||
          state.matchedLocation == RegisterView.routeName ||
          state.matchedLocation == ForgotPasswordView.routeName;

      final isResetPasswordPage =
          state.matchedLocation == ResetPasswordView.routeName;

      final isSplash = state.matchedLocation == SplashView.routeName;

      // Still loading auth state
      if (authStatus == AuthStatus.unknown) {
        return SplashView.routeName;
      }

      // Leave splash once auth is known
      if (isSplash) {
        return authStatus == AuthStatus.authenticated
            ? HomeView.routeName
            : LoginView.routeName;
      }

      if (authCubit.state.authFlow == AuthFlow.passwordReset) {
        return isResetPasswordPage ? null : ResetPasswordView.routeName;
      }

      // User is authenticated
      if (authStatus == AuthStatus.authenticated) {
        // Redirect away from auth pages if already logged in
        if (isOnAuthPage) {
          return HomeView.routeName;
        }

        return null; // Allow access to requested page
      }

      // User is unauthenticated
      if (authStatus == AuthStatus.unauthenticated) {
        // Allow access to auth pages
        if (isOnAuthPage) {
          return null;
        }
        // Redirect to login for protected pages
        return LoginView.routeName;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: SplashView.routeName,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.routeName,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<CategoriesCubit>()..loadCategories(),
            ),
            BlocProvider(
              create: (context) => getIt<ProductFeedCubit>()..loadProducts(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<GetPromotionsCubit>()..loadPromotions(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: LoginView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LogInCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RegisterView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: ForgotPasswordView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgotPasswordCubit>(),
          child: const ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: ResetPasswordView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ResetPasswordCubit>(),
          child: const ResetPasswordView(),
        ),
      ),
      GoRoute(
        path: CartView.routeName,
        builder: (context, state) {
          context.read<CartCubit>().getCart();
          return const CartView();
        },
      ),
      GoRoute(
        path: ProductDetailsView.routeName,
        builder: (context, state) {
          final productId = state.extra as String;
          return BlocProvider(
            create: (context) =>
                getIt<ProductDetailsCubit>()..loadProductDetails(productId),
            child: const ProductDetailsView(),
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (context) => getIt<AddressesCubit>()..getAddresses(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: SavedAddressesView.routeName,
            builder: (context, state) => const SavedAddressesView(),
          ),
          GoRoute(
            path: AddAddressView.routeName,
            builder: (context, state) => const AddAddressView(),
          ),
          GoRoute(
            path: EditAddressView.routeName,
            builder: (context, state) => const EditAddressView(),
          ),
        ],
      ),
      GoRoute(
        path: PaymentMethodsView.routeName,
        builder: (context, state) => const PaymentMethodsView(),
      ),
      GoRoute(
        path: AddPaymentMethodView.routeName,
        builder: (context, state) => const AddPaymentMethodView(),
      ),
      GoRoute(
        path: ProfileView.routeName,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: EditProfileView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ImagePickerCubit>(),
          child: const EditProfileView(),
        ),
      ),
      GoRoute(
        path: PersonalDetailsView.routeName,
        builder: (context, state) => const PersonalDetailsView(),
      ),
      GoRoute(
        path: WishListView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<GetWishListCubit>()..getWishList(),

          child: const WishListView(),
        ),
      ),
      GoRoute(
        path: SettingsView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<NotificationsSettingsCubit>(),
          child: const SettingsView(),
        ),
      ),
      GoRoute(
        path: CheckoutView.routeName,
        builder: (context, state) {
          final cart = state.extra as Cart;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<CheckoutCubit>()..initDefaults(cart: cart),
              ),
              BlocProvider(create: (context) => getIt<CheckoutFlowCubit>()),
            ],
            child: const CheckoutView(),
          );
        },
      ),
      GoRoute(
        path: SearchResultsView.routeName,
        builder: (context, state) {
          final String query = state.extra as String? ?? '';
          return BlocProvider(
            create: (context) =>
                getIt<ProductSearchCubit>()..searchProducts(query),
            child: SearchResultsView(query: query),
          );
        },
      ),
      GoRoute(
        path: CategoryProductsView.routeName,
        builder: (context, state) {
          final category = state.extra as Category;
          return BlocProvider(
            create: (context) =>
                getIt<GetProductsByCategoryCubit>()
                  ..getProductsByCategory(category.id),
            child: const CategoryProductsView(),
          );
        },
      ),
      GoRoute(
        path: OrdersView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<GetOrdersCubit>()..getOrders(),
          child: const OrdersView(),
        ),
      ),
      GoRoute(
        path: OrderDetailsView.routeName,
        builder: (context, state) {
          final orderId = state.extra as String;
          return BlocProvider(
            create: (context) =>
                getIt<GetOrderDetailsCubit>()
                  ..getOrderDetails(orderId: orderId),
            child: OrderDetailsView(),
          );
        },
      ),
      GoRoute(
        path: PaymentConfirmationView.routeName,
        builder: ((context, state) {
          final String orderId =
              state.uri.queryParameters['merchant_order_id']!;
          return BlocProvider(
            create: (context) =>
                getIt<PaymentConfirmationCubit>(param1: orderId),
            child: PaymentConfirmationView(),
          );
        }),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _authSub;

  GoRouterRefreshStream(AuthCubit authCubit) {
    _authSub = authCubit.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _authSub.cancel();
    super.dispose();
  }
}
