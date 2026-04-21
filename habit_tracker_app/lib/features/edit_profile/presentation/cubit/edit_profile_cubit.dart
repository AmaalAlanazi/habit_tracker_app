import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:habit_tracker_app/features/edit_profile/presentation/cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;

  EditProfileCubit(this._editProfileUseCase) : super(EditProfileInitialState());
  Future<void> updateProfile({String? name, String? email}) async {
    emit(EditProfileLoadingState());

    try {
      await _editProfileUseCase.updateProfile(name: name, email: email);

      emit(EditProfileSuccessState());
    } catch (e) {
      emit(EditProfileErrorState(message: e.toString()));
    }
  }
}
