import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/bottom_bar/domain/repositories/bottom_bar_repository_domain.dart';

@lazySingleton
class BottomBarUseCase {
  final BottomBarRepositoryDomain _repositoryData;

  BottomBarUseCase(this._repositoryData);

  Future<Result<List<Map<String, dynamic>>, Failure>> fetchCategories() {
    return _repositoryData.getAllCategories();
  }

  Future<Result<Unit, Failure>> addHabit({
    required String title,
    required String categoryId,
    required String reminderTime,
  }) {
    return _repositoryData.addHabit(
      title: title,
      categoryId: categoryId,
      reminderTime: reminderTime,
    );
  }
}