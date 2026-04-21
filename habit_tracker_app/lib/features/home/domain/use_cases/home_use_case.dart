import 'package:habit_tracker_app/core/common/entities/habit_entity.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';

import 'package:habit_tracker_app/features/home/domain/repositories/home_repository_domain.dart';

@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repository;

  HomeUseCase(this._repository);

  Future<Result<List<HabitEntity>, Failure>> getTodayHabits() async {
    return await _repository.getTodayHabits();
  }
  Future<Result<void, Failure>> toggleHabitCompletion(String habitId, bool isCompleted) async {
    return await _repository.toggleHabitCompletion(habitId, isCompleted);
  }
}