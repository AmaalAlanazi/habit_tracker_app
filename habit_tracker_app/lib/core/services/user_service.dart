import 'package:habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  UserEntity? _user;

  void setUser(UserEntity users) {
    _user = users;
  }

  UserEntity? get users {
    return _user;
  }

  void signOut() {
    _user = null;
  }
}
