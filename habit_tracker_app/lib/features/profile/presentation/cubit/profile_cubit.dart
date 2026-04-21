import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:habit_tracker_app/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitialState());

  Future<void> loadProfile() async {
    emit(ProfileLoadingState());

    try {
      final profile = await _profileUseCase.getProfile();
      emit(ProfileSuccessState(profile: profile));
    } catch (e) {
      emit(ProfileErrorState(message: e.toString()));
    }
  }
}
