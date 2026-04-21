import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/change_password/data/datasources/change_password_remote_data_source.dart';
import 'package:habit_tracker_app/features/change_password/domain/repositories/change_password_repository_domain.dart';

@LazySingleton(as: ChangePasswordRepositoryDomain)
class ChangePasswordRepositoryData implements ChangePasswordRepositoryDomain {
  final BaseChangePasswordRemoteDataSource remoteDataSource;

  ChangePasswordRepositoryData(this.remoteDataSource);

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.changePassword(newPassword: newPassword);
      return const Right(unit);
    } catch (e) {
      return Left(FailureExceptions.getException(e));
    }
  }
}
