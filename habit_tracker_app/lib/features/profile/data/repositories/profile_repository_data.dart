import 'package:habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:habit_tracker_app/core/common/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:habit_tracker_app/features/profile/domain/repositories/profile_repository_domain.dart';

@LazySingleton(as: ProfileRepositoryDomain)
class ProfileRepositoryData implements ProfileRepositoryDomain {
  final BaseProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryData(this.remoteDataSource);

  @override
  Future<UserEntity> getProfile() async {
    final model = await remoteDataSource.getProfile();
    return model.toEntity();
  }
}
