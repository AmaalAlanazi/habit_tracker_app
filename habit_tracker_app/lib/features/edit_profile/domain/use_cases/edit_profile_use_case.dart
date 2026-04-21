import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/edit_profile/domain/repositories/edit_profile_repository_domain.dart';

@lazySingleton
class EditProfileUseCase {
  final EditProfileRepositoryDomain _repositoryData;

  EditProfileUseCase(this._repositoryData);

  Future<void> updateProfile({String? name, String? email}) async {
    return _repositoryData.updateProfile(name: name, email: email);
  }
}
