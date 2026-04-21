import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:habit_tracker_app/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    final result = await _loginUseCase.login(email: email, password: password);

    result.when(
      (user) => emit(LoginSuccessState()),
      (failure) => emit(LoginErrorState(message: failure.message)),
    );
  }
}
