import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/category/domain/repositories/category_repository_domain.dart';

@lazySingleton
class CategoryUseCase {
  final CategoryRepositoryDomain _repository;
  CategoryUseCase(this._repository);

  Future<Result<List<Map<String, dynamic>>, Failure>> getCategories() =>
      _repository.fetchCategories();
      
  Future<Result<Unit, Failure>> execute(
    String title,
    String colorHex,
    String iconName,
  ) {
    return _repository.addCategory(title, colorHex, iconName);
  }
}
