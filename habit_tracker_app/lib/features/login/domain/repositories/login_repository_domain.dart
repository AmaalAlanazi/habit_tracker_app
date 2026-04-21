import 'package:habit_tracker_app/core/errors/failure.dart';
import 'package:habit_tracker_app/features/login/domain/entities/login_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class LoginRepositoryDomain {
  Future<Result<LoginEntity, Failure>> login({
    required String email,
    required String password,
  });
}
