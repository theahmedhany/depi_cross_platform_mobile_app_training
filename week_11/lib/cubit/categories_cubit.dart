import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/api_service.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final ApiService _apiService;

  CategoriesCubit(this._apiService) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    try {
      emit(CategoriesLoading());
      final categories = await _apiService.fetchCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  void selectCategory(String? category) {
    final currentState = state;
    if (currentState is CategoriesLoaded) {
      emit(
        CategoriesLoaded(currentState.categories, selectedCategory: category),
      );
    }
  }

  void resetSelection() {
    final currentState = state;
    if (currentState is CategoriesLoaded) {
      emit(CategoriesLoaded(currentState.categories));
    }
  }
}
