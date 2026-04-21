import 'package:habit_tracker_app/core/common/entities/user_entity.dart';

abstract class ProfileRepositoryDomain {
  Future<UserEntity> getProfile();
}
