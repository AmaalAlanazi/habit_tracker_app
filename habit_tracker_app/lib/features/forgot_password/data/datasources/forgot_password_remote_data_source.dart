import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseForgotPasswordRemoteDataSource {
  Future<void> forgotPassword({required String email});
}

@LazySingleton(as: BaseForgotPasswordRemoteDataSource)
class ForgotPasswordRemoteDataSource
    implements BaseForgotPasswordRemoteDataSource {
  final SupabaseClient _supabase;

  ForgotPasswordRemoteDataSource(this._supabase);

  @override
  Future<void> forgotPassword({required String email}) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }
}
