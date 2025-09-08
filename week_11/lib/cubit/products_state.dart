part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductsLoaded(this.products);

  @override
  String toString() => 'ProductsLoaded(products: ${products.length})';
}

class ProductDetailLoaded extends ProductsState {
  final ProductModel product;

  ProductDetailLoaded(this.product);

  @override
  String toString() => 'ProductDetailLoaded(product: ${product.title})';
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);

  @override
  String toString() => 'ProductsError(message: $message)';
}
