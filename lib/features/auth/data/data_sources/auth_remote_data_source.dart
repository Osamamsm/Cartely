import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required String email, required String password});

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  });

  Future<void> requestPasswordReset({required String email});

  Future<UserResponse> resetPassword({required String password});

  Future<void> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseService _service;

  AuthRemoteDataSourceImpl(this._service);

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await _service.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  @override
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    AuthResponse response = await _service.auth.signUp(
      email: email,
      password: password,
      data: {'fullName': fullName, 'phoneNumber': phoneNumber},
      emailRedirectTo: "my-e-commerce-app://auth/callback",
    );
    return response;
  }

  @override
  Future<void> requestPasswordReset({required String email}) async {
    await _service.auth.resetPasswordForEmail(
      email,
      redirectTo: "my-e-commerce-app://auth/reset-password",
    );
  }

  @override
  Future<UserResponse> resetPassword({required String password}) async {
    return await _service.auth.updateUser(UserAttributes(password: password));
  }

  @override
  Future<void> signOut() async {
    await _service.auth.signOut();
  }
}
