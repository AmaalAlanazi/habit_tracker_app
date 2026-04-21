import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String id;
  final String email;

  const LoginEntity({required this.id, required this.email});

  @override
  List<Object?> get props => [id, email];
}
