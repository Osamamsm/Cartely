import 'package:e_commerce/core/dependency_injection/di.dart';
import 'package:e_commerce/core/notifications_service/local_notifications_service.dart';
import 'package:e_commerce/core/notifications_service/push_notifications_service.dart';
import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/supabase/supabase_config.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_out_cubit/sign_out_cubit.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/settings/presentation/logic/cubit/app_settings_cubit.dart';
import 'package:e_commerce/features/settings/presentation/logic/cubit/app_settings_state.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_cubit.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Future.wait([
    PushNotificationsService.init(),
    LocalNotificationsService.init(),
  ]);
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.anonKey,
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final authCubit = getIt<AuthCubit>();
    final router = createRouter(authCubit);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => authCubit),
        BlocProvider(create: (context) => getIt<SignOutCubit>()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()),
        BlocProvider(create: (context) => getIt<AppSettingsCubit>()),
        BlocProvider(
          create: (context) => getIt<WishlistCubit>()..getWishListedIds(),
        ),
        BlocProvider(create: (context) => getIt<CartCubit>()..getCart()),
      ],
      child: BlocListener<AuthCubit, AppAuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.cleared) {
            context.read<SignOutCubit>().signOut();
          }
        },
        child: ScreenUtilInit(
          child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              return MaterialApp.router(
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: state.themeMode,
                locale: state.locale,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
              );
            },
          ),
        ),
      ),
    );
  }
}
