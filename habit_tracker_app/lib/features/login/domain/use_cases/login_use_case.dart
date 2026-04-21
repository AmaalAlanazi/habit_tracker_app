import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/login/domain/entities/login_entity.dart';
import 'package:habit_tracker_app/features/login/domain/repositories/login_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class LoginUseCase {
  final LoginRepositoryDomain _repositoryData;

  LoginUseCase(this._repositoryData);

  Future<Result<LoginEntity, Failure>> login({
    required String email,
    required String password,
  }) {
    return _repositoryData.login(email: email, password: password);
  }
}
