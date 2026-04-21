import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class BaseCategoryRemoteDataSource {
  Future<List<Map<String, dynamic>>> getCategoriesWithCount();
  Future<void> addCategory(String title, String colorHex, String iconName);
}

@LazySingleton(as: BaseCategoryRemoteDataSource)
class CategoryRemoteDataSource implements BaseCategoryRemoteDataSource {
  final SupabaseClient _supabase;
  CategoryRemoteDataSource(this._supabase);

  @override
  Future<List<Map<String, dynamic>>> getCategoriesWithCount() async {
    return await _supabase.from('categories').select('*, habits(*)');
  }

  @override
  Future<void> addCategory(
    String title,
    String colorHex,
    String iconName,
  ) async {
    await _supabase.from('categories').insert({
      'title': title,
      'color_hex': colorHex,
      'icon_name': iconName,
      'user_id': _supabase.auth.currentUser!.id,
    });
  }
}
