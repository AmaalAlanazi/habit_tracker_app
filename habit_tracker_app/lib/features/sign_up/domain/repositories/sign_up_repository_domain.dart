import 'package:habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SignUpRepositoryDomain {
  Future<Result<UserEntity, Failure>> signUp({
    required String email,
    required String password,
    required String name,
  });
}
