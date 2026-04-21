import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/category/domain/use_cases/category_use_case.dart';
import 'package:habit_tracker_app/features/category/presentation/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryUseCase _useCase;
  CategoryCubit(this._useCase) : super(CategoryInitial());

  Future<void> loadCategories() async {
    emit(CategoryLoading());
    final result = await _useCase.getCategories();
    result.when(
      (success) => emit(CategoryLoaded(success)),
      (whenError) => emit(CategoryError(whenError.message)),
    );
  }

  Future<void> addNewCategory(
    String title,
    String colorHex,
    String iconName,
  ) async {
    final result = await _useCase.execute(title, colorHex, iconName);
    result.when(
      (success) => loadCategories(),
      (error) => emit(CategoryError(error.message)),
    );
  }
}
