import 'package:multiple_result/multiple_result.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/core/common/entities/habit_entity.dart';

abstract class HomeRepositoryDomain {
  Future<Result<List<HabitEntity>, Failure>> getTodayHabits();
  Future<Result<void, Failure>> toggleHabitCompletion(String habitId, bool isCompleted);
}