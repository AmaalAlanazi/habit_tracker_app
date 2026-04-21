import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:habit_tracker_app/core/common/models/habit_model.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<HabitModel>> getTodayHabits();
  Future<void> toggleHabitCompletion(String habitId, bool isCompleted);
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final SupabaseClient _supabase;

  HomeRemoteDataSource(this._supabase);

  @override
  Future<List<HabitModel>> getTodayHabits() async {
    try {
      final today = DateTime.now().toIso8601String().split('T')[0];

      final response = await _supabase
          .from('habits')
          .select('*, categories(icon_name, color_hex)')
          .order('created_at');

      final logs = await _supabase
          .from('habit_log')
          .select()
          .eq('log_date', today);

      return (response as List).map((habit) {
        final isDone = logs.any(
          (log) =>
              log['habit_id'] == habit['id'] && log['is_completed'] == true,
        );

        final habitData = Map<String, dynamic>.from(habit);
        habitData['icon_name'] = habit['categories']['icon_name'];
        habitData['color_hex'] = habit['categories']['color_hex'];
        habitData['is_completed_today'] = isDone;

        return HabitModel.fromJson(habitData);
      }).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> toggleHabitCompletion(String habitId, bool isCompleted) async {
    try {
      final today = DateTime.now().toIso8601String().split('T')[0];

      if (isCompleted) {
        await _supabase
            .from('habit_log')
            .delete()
            .eq('habit_id', habitId)
            .eq('log_date', today);
      } else {
        await _supabase.from('habit_log').insert({
          'habit_id': habitId,
          'log_date': today,
          'is_completed': true,
        });
      }
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}