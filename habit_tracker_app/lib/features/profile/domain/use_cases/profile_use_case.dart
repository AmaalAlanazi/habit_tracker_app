import 'package:habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:habit_tracker_app/core/services/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/profile/domain/repositories/profile_repository_domain.dart';

@lazySingleton
class ProfileUseCase {
  final ProfileRepositoryDomain _repositoryData;

  ProfileUseCase(this._repositoryData);

  Future<UserEntity> getProfile() async {
    final user = await _repositoryData.getProfile();

    UserService().setUser(user);
    return user;
  }
}
