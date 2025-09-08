import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';
import '../services/api_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiService _apiService;

  ProductsCubit(this._apiService) : super(ProductsInitial());

  /// Fetch all products
  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoading());
      final products = await _apiService.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  /// Fetch product by ID
  Future<void> fetchProductById(int id) async {
    try {
      emit(ProductsLoading());
      final product = await _apiService.fetchProductById(id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  /// Fetch products by category
  Future<void> fetchProductsByCategory(String category) async {
    try {
      emit(ProductsLoading());
      final products = await _apiService.fetchProductsByCategory(category);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  /// Search products by title
  void searchProducts(String query) {
    final currentState = state;
    if (currentState is ProductsLoaded) {
      if (query.isEmpty) {
        // If search query is empty, fetch all products again
        fetchProducts();
      } else {
        final filteredProducts = currentState.products
            .where(
              (product) =>
                  product.title.toLowerCase().contains(query.toLowerCase()) ||
                  product.category.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        emit(ProductsLoaded(filteredProducts));
      }
    }
  }

  /// Refresh products
  Future<void> refreshProducts() async {
    await fetchProducts();
  }

  /// Reset to initial state
  void reset() {
    emit(ProductsInitial());
  }
}
