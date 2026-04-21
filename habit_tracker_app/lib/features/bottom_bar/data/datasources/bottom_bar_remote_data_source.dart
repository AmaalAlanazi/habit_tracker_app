import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseBottomBarRemoteDataSource {
  Future<List<Map<String, dynamic>>> getCategories();
  Future<void> addHabit({
    required String title,
    required String categoryId,
    required String reminderTime,
  });
}

@LazySingleton(as: BaseBottomBarRemoteDataSource)
class BottomBarRemoteDataSource implements BaseBottomBarRemoteDataSource {
  final SupabaseClient _supabase;

  BottomBarRemoteDataSource(this._supabase);

  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    final user = _supabase.auth.currentUser;

    log('current user => ${user?.id}');

    if (user == null) {
      final response = await _supabase
          .from('categories')
          .select()
          .order('title');

      log('all categories => $response');
      return List<Map<String, dynamic>>.from(response);
    }

    final response = await _supabase
        .from('categories')
        .select()
        .eq('user_id', user.id)
        .order('title');

    log('filtered categories => $response');

    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<void> addHabit({
    required String title,
    required String categoryId,
    required String reminderTime,
  }) async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }

    await _supabase.from('habits').insert({
      'user_id': user.id,
      'category_id': categoryId,
      'title': title,
      'reminder_time': reminderTime,
    });
  }
}
