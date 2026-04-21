import 'package:habit_tracker_app/core/common/entities/habit_entity.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<HabitEntity> habits;
  HomeSuccessState({required this.habits});
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState({required this.errorMessage});
}