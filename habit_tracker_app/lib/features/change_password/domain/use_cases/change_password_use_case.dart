import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/change_password/domain/repositories/change_password_repository_domain.dart';

@lazySingleton
class ChangePasswordUseCase {
  final ChangePasswordRepositoryDomain _repositoryData;

  ChangePasswordUseCase(this._repositoryData);

  Future<Either<Failure, Unit>> changePassword({required String newPassword}) {
    return _repositoryData.changePassword(newPassword: newPassword);
  }
}
