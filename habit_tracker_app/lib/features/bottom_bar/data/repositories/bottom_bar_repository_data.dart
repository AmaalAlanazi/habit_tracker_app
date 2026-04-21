import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/bottom_bar/data/datasources/bottom_bar_remote_data_source.dart';
import 'package:habit_tracker_app/features/bottom_bar/domain/repositories/bottom_bar_repository_domain.dart';

@LazySingleton(as: BottomBarRepositoryDomain)
class BottomBarRepositoryData implements BottomBarRepositoryDomain {
  final BaseBottomBarRemoteDataSource remoteDataSource;

  BottomBarRepositoryData(this.remoteDataSource);

  @override
  Future<Result<Unit, Failure>> addHabit({
    required String title,
    required String categoryId,
    required String reminderTime,
  }) async {
    try {
      await remoteDataSource.addHabit(
        title: title,
        categoryId: categoryId,
        reminderTime: reminderTime,
      );
      return const Success(unit);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>, Failure>> getAllCategories() async {
    try {
      final response = await remoteDataSource.getCategories();
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
