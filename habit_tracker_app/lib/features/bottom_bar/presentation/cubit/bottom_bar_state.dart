abstract class BottomBarState {}

class BottomBarInitialState extends BottomBarState {}

class BottomBarLoadingState extends BottomBarState {}

class BottomBarSuccessState extends BottomBarState {}

class BottomBarCategoriesLoadedState extends BottomBarState {
  final List<Map<String, dynamic>> categories;

  BottomBarCategoriesLoadedState({required this.categories});
}

class BottomBarErrorState extends BottomBarState {
  final String message;

  BottomBarErrorState({required this.message});
}