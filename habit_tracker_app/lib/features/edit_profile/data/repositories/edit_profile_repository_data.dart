import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:habit_tracker_app/features/edit_profile/data/datasources/edit_profile_remote_data_source.dart';
import 'package:habit_tracker_app/features/edit_profile/domain/repositories/edit_profile_repository_domain.dart';

@LazySingleton(as: EditProfileRepositoryDomain)
class EditProfileRepositoryData implements EditProfileRepositoryDomain {
  final BaseEditProfileRemoteDataSource remoteDataSource;

  EditProfileRepositoryData(this.remoteDataSource);

  @override
  Future<void> updateProfile({String? name, String? email}) async {
    try {
      await remoteDataSource.updateProfile(name: name, email: email);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
