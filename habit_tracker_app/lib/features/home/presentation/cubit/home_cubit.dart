import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/home/domain/use_cases/home_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/home/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _getTodayHabitsUseCase;

  HomeCubit(this._getTodayHabitsUseCase) : super(HomeLoadingState());

  Future<void> getTodayHabits() async {
    emit(HomeLoadingState());

    final result = await _getTodayHabitsUseCase.getTodayHabits();

    result.when(
      (success) {
        emit(HomeSuccessState(habits: success));
      },
      (whenError) {
        emit(HomeErrorState(errorMessage: whenError.message));
      },
    );
  }

  Future<void> toggleHabit(String id, bool isDone) async {
    final result = await _getTodayHabitsUseCase.toggleHabitCompletion(
      id,
      isDone,
    );

    result.when(
      (success) => getTodayHabits(),
      (whenError) => emit(HomeErrorState(errorMessage: whenError.message)),
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}