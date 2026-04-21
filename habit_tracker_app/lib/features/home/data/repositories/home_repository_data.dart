import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/core/common/entities/habit_entity.dart';
import 'package:habit_tracker_app/core/common/models/habit_model.dart';
import 'package:habit_tracker_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:habit_tracker_app/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain {
  final BaseHomeRemoteDataSource remoteDataSource;

  HomeRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HabitEntity>, Failure>> getTodayHabits() async {
    try {
      final response = await remoteDataSource.getTodayHabits();

      final entities = response.map((model) => model.toEntity()).toList();

      return Success(entities);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> toggleHabitCompletion(
    String habitId,
    bool isCompleted,
  ) async {
    try {
      await remoteDataSource.toggleHabitCompletion(habitId, isCompleted);
      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}