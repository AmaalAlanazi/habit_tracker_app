import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';

abstract class BaseEditProfileRemoteDataSource {
  Future<void> updateProfile({String? name, String? email});
}

@LazySingleton(as: BaseEditProfileRemoteDataSource)
class EditProfileRemoteDataSource implements BaseEditProfileRemoteDataSource {
  final SupabaseClient _supabase;

  EditProfileRemoteDataSource(this._supabase);

  @override
  Future<void> updateProfile({String? name, String? email}) async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User not logged in');
      }

      final updates = <String, dynamic>{};

      if (name != null) updates['name'] = name;
      if (email != null) updates['email'] = email;

      if (updates.isEmpty) {
        throw Exception('No fields to update');
      }

      await _supabase.from('users').update(updates).eq('id', userId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
