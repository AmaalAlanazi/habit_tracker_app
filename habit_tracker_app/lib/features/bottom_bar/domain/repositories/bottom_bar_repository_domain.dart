import 'package:multiple_result/multiple_result.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';

abstract class BottomBarRepositoryDomain {
  Future<Result<List<Map<String, dynamic>>, Failure>> getAllCategories();

  Future<Result<Unit, Failure>> addHabit({
    required String title,
    required String categoryId,
    required String reminderTime,
  });
}