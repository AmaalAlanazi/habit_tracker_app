import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/login/domain/entities/login_entity.dart';
import 'package:habit_tracker_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:habit_tracker_app/features/login/data/models/login_model.dart';
import 'package:habit_tracker_app/features/login/domain/repositories/login_repository_domain.dart';

@LazySingleton(as: LoginRepositoryDomain)
class LoginRepositoryData implements LoginRepositoryDomain {
  final BaseLoginRemoteDataSource remoteDataSource;

  LoginRepositoryData(this.remoteDataSource);

  @override
  Future<Result<LoginEntity, Failure>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        email: email,
        password: password,
      );

      return Success(LoginModel.fromSupabase(user).toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
