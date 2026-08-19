import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  GoTrueClient get auth => _client.auth;

  SupabaseQueryBuilder from(String table) => _client.from(table);

  SupabaseStorageClient get storage => _client.storage;

  PostgrestFilterBuilder rpc({
    required String function,
    Map<String, dynamic>? params,
  }) => _client.rpc(function, params: params);

  Future<FunctionResponse> invokeFunction({
    required String name,
    required Map<String, dynamic> body,
  }) => _client.functions.invoke(name, body: body);

  User? get currentUser => auth.currentUser;

  Session? get currentSession => auth.currentSession;
}
