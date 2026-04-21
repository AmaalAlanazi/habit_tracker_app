import 'package:habit_tracker_app/features/login/domain/entities/login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({required String id, required String email}) =
      _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  factory LoginModel.fromSupabase(dynamic user) {
    return LoginModel(id: user.id, email: user.email ?? '');
  }
}

extension LoginModelMapper on LoginModel {
  LoginEntity toEntity() {
    return LoginEntity(id: id, email: email);
  }
}
