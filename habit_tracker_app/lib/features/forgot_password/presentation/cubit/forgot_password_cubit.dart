import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/forgot_password/domain/use_cases/forgot_password_use_case.dart';
import 'package:habit_tracker_app/features/forgot_password/presentation/cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
    : super(ForgotPasswordInitialState());

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoadingState());

    try {
      await _forgotPasswordUseCase(email: email);
      emit(ForgotPasswordSuccessState());
    } catch (e) {
      emit(ForgotPasswordErrorState(message: e.toString()));
    }
  }
}
