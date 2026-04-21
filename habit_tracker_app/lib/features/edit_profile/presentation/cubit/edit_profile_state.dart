import 'package:equatable/equatable.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitialState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileErrorState extends EditProfileState {
  final String message;
  const EditProfileErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
