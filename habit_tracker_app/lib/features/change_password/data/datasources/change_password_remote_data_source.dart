import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseChangePasswordRemoteDataSource {
  Future<void> changePassword({required String newPassword});
}

@LazySingleton(as: BaseChangePasswordRemoteDataSource)
class ChangePasswordRemoteDataSource
    implements BaseChangePasswordRemoteDataSource {
  final SupabaseClient _supabase;

  ChangePasswordRemoteDataSource(this._supabase);

  @override
  Future<void> changePassword({required String newPassword}) async {
    await _supabase.auth.updateUser(UserAttributes(password: newPassword));
  }
}
