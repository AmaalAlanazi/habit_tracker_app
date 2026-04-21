import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import '../../domain/repositories/category_repository_domain.dart';
import '../datasources/category_remote_data_source.dart';

@LazySingleton(as: CategoryRepositoryDomain)
class CategoryRepositoryData implements CategoryRepositoryDomain {
  final BaseCategoryRemoteDataSource remoteDataSource;
  CategoryRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<Map<String, dynamic>>, Failure>> fetchCategories() async {
    try {
      final response = await remoteDataSource.getCategoriesWithCount();
      return Success(response);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }

  @override
  Future<Result<Unit, Failure>> addCategory(
    String title,
    String colorHex,
    String iconName,
  ) async {
    try {
      await remoteDataSource.addCategory(title, colorHex, iconName);
      return const Success(unit);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }
}
