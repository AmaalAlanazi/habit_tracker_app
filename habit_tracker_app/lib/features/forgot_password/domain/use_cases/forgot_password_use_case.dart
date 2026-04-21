import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/forgot_password/domain/repositories/forgot_password_repository_domain.dart';

@lazySingleton
class ForgotPasswordUseCase {
  final ForgotPasswordRepositoryDomain _repositoryData;

  ForgotPasswordUseCase(this._repositoryData);

  Future<void> call({required String email}) {
    return _repositoryData.forgotPassword(email: email);
  }
}
