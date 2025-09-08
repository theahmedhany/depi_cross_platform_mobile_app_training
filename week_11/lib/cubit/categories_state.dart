part of 'categories_cubit.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<String> categories;
  final String? selectedCategory;

  CategoriesLoaded(this.categories, {this.selectedCategory});

  @override
  String toString() =>
      'CategoriesLoaded(categories: ${categories.length}, selected: $selectedCategory)';
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);

  @override
  String toString() => 'CategoriesError(message: $message)';
}
