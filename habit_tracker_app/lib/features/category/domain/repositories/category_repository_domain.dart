import 'package:multiple_result/multiple_result.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';

abstract class CategoryRepositoryDomain {
  Future<Result<List<Map<String, dynamic>>, Failure>> fetchCategories();
  Future<Result<Unit, Failure>> addCategory(
    String title,
    String colorHex,
    String iconName,
  );
}
