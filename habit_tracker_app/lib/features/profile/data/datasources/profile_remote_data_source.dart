import 'package:habit_tracker_app/core/common/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseProfileRemoteDataSource {
  Future<UserModel> getProfile();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;

  ProfileRemoteDataSource(this._supabase);

  @override
  Future<UserModel> getProfile() async {
    final userId = _supabase.auth.currentUser?.id;

    if (userId == null) {
      throw Exception('User not logged in');
    }

    final data = await _supabase
        .from('users')
        .select()
        .eq('id', userId)
        .single();

    return UserModel.fromJson(data);
  }
}
