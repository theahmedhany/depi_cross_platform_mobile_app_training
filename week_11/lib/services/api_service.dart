import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        error: true,
        logPrint: (obj) => print('[API] $obj'),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print('[API Error] ${error.message}');
          handler.next(error);
        },
      ),
    );
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get('/products');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        if (data.isEmpty) {
          return [];
        }
        return data
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiException(
          'Failed to fetch products: ${response.statusCode}',
          response.statusCode ?? 0,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error occurred: $e', 0);
    }
  }

  Future<ProductModel> fetchProductById(int id) async {
    try {
      final response = await _dio.get('/products/$id');

      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ApiException(
          'Failed to fetch product: ${response.statusCode}',
          response.statusCode ?? 0,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error occurred: $e', 0);
    }
  }

  Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    try {
      final response = await _dio.get('/products/category/$category');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        if (data.isEmpty) {
          return [];
        }
        return data
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiException(
          'Failed to fetch products by category: ${response.statusCode}',
          response.statusCode ?? 0,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error occurred: $e', 0);
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      final response = await _dio.get('/products/categories');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        if (data.isEmpty) {
          return [];
        }
        return data.cast<String>();
      } else {
        throw ApiException(
          'Failed to fetch categories: ${response.statusCode}',
          response.statusCode ?? 0,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ApiException('Unexpected error occurred: $e', 0);
    }
  }

  ApiException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException('Connection timeout', 408);
      case DioExceptionType.sendTimeout:
        return ApiException('Send timeout', 408);
      case DioExceptionType.receiveTimeout:
        return ApiException('Receive timeout', 408);
      case DioExceptionType.badResponse:
        return ApiException(
          'Server error: ${error.response?.statusMessage}',
          error.response?.statusCode ?? 500,
        );
      case DioExceptionType.cancel:
        return ApiException('Request cancelled', 499);
      case DioExceptionType.connectionError:
        return ApiException('No internet connection', 503);
      default:
        return ApiException('Network error occurred', 500);
    }
  }
}

class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException(this.message, this.statusCode);

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}
