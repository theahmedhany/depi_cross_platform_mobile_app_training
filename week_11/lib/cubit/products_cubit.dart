import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';
import '../services/api_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiService _apiService;
  List<ProductModel> _allProducts = [];

  ProductsCubit(this._apiService) : super(ProductsInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoading());
      final products = await _apiService.fetchProducts();
      _allProducts = products;
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  Future<void> fetchProductById(int id) async {
    try {
      emit(ProductsLoading());
      final product = await _apiService.fetchProductById(id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  Future<void> fetchProductsByCategory(String category) async {
    try {
      emit(ProductsLoading());
      final products = await _apiService.fetchProductsByCategory(category);
      _allProducts = products;
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  void searchProducts(String query) {
    if (_allProducts.isEmpty) {
      return;
    }

    if (query.isEmpty) {
      emit(ProductsLoaded(_allProducts));
    } else {
      final filteredProducts = _allProducts
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()) ||
                product.category.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      emit(ProductsLoaded(filteredProducts));
    }
  }

  Future<void> refreshProducts() async {
    await fetchProducts();
  }

  void reset() {
    _allProducts.clear();
    emit(ProductsInitial());
  }
}
