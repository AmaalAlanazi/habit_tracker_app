import 'package:fpdart/fpdart.dart';
import 'package:habit_tracker_app/core/errors/failure.dart';

abstract class ChangePasswordRepositoryDomain {
  Future<Either<Failure, Unit>> changePassword({required String newPassword});
}
