import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:habit_tracker_app/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitialState());

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoadingState());

    final result = await _signUpUseCase.signUp(
      email: email,
      password: password,
      name: name,
    );

    result.when(
      (user) {
        emit(SignUpSuccessState());
      },
      (failure) {
        emit(SignUpErrorState(message: failure.message));
      },
    );
  }
}
