import 'package:habit_tracker_app/core/common/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;

  SignUpRemoteDataSource(this._supabase);

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final result = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    final user = result.user!;

    final data = {"id": user.id, "name": name, "email": email};

    await _supabase.from('users').insert(data);

    return UserModel.fromJson(data);
  }
}
