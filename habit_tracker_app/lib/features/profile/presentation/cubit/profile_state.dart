import 'package:equatable/equatable.dart';
import 'package:habit_tracker_app/core/common/entities/user_entity.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final UserEntity profile;

  const ProfileSuccessState({required this.profile});
  @override
  List<Object?> get props => [profile];
}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
