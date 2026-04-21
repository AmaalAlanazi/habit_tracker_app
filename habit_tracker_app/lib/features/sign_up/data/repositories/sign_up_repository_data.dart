import 'package:habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:habit_tracker_app/core/common/models/user_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/sign_up/data/datasources/sign_up_remote_data_source.dart';
import 'package:habit_tracker_app/features/sign_up/domain/repositories/sign_up_repository_domain.dart';

@LazySingleton(as: SignUpRepositoryDomain)
class SignUpRepositoryData implements SignUpRepositoryDomain {
  final BaseSignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryData(this.remoteDataSource);

  @override
  Future<Result<UserEntity, Failure>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await remoteDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );

      return Success(result.toEntity());
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }
}
