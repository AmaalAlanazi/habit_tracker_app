import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/bottom_bar/domain/use_cases/bottom_bar_use_case.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/cubit/bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  final BottomBarUseCase _bottomBarUseCase;

  List<Map<String, dynamic>> categoriesList = [];

  BottomBarCubit(this._bottomBarUseCase) : super(BottomBarInitialState());

  Future<void> getCategories() async {
    emit(BottomBarLoadingState());

    final result = await _bottomBarUseCase.fetchCategories();

    result.when(
      (success) {
        categoriesList = success;
        emit(BottomBarCategoriesLoadedState(categories: success));
      },
      (whenError) {
        emit(BottomBarErrorState(message: whenError.message));
      },
    );
  }

  Future<void> addNewHabit({
    required String title,
    required String cId,
    required String time,
  }) async {
    emit(BottomBarLoadingState());

    final result = await _bottomBarUseCase.addHabit(
      title: title,
      categoryId: cId,
      reminderTime: time,
    );

    result.when(
      (success) => emit(BottomBarSuccessState()),
      (whenError) => emit(BottomBarErrorState(message: whenError.message)),
    );
  }
}