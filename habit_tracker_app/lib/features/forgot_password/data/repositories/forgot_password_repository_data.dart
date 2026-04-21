import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/forgot_password/data/datasources/forgot_password_remote_data_source.dart';
import 'package:habit_tracker_app/features/forgot_password/domain/repositories/forgot_password_repository_domain.dart';

@LazySingleton(as: ForgotPasswordRepositoryDomain)
class ForgotPasswordRepositoryData implements ForgotPasswordRepositoryDomain {
  final BaseForgotPasswordRemoteDataSource remoteDataSource;

  ForgotPasswordRepositoryData(this.remoteDataSource);

  @override
  Future<void> forgotPassword({required String email}) {
    return remoteDataSource.forgotPassword(email: email);
  }
}
