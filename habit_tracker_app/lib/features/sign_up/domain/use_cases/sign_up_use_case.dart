import 'package:habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/sign_up/domain/repositories/sign_up_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SignUpUseCase {
  final SignUpRepositoryDomain _repositoryData;

  SignUpUseCase(this._repositoryData);
  Future<Result<UserEntity, Failure>> signUp({
    required String email,
    required String password,
    required String name,
  }) {
    return _repositoryData.signUp(email: email, password: password, name: name);
  }
}
