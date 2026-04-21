import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:habit_tracker_app/features/change_password/presentation/cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordCubit(this._changePasswordUseCase)
    : super(ChangePasswordInitialState());

  Future<void> changePassword(String password) async {
    emit(ChangePasswordLoading());

    final result = await _changePasswordUseCase.changePassword(
      newPassword: password,
    );

    result.fold(
      (failure) => emit(ChangePasswordErrorState(message: failure.message)),
      (_) => emit(ChangePasswordSuccessState()),
    );
  }
}
