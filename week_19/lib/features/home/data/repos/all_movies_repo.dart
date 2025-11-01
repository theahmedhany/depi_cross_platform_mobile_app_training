import 'package:week_19/features/home/data/models/all_movies_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class AllMoviesRepo {
  final ApiServices apiServices;

  AllMoviesRepo(this.apiServices);

  Future<ApiResult<AllMoviesModel>> getAllMovies(String page) async {
    try {
      var response = await apiServices.allMovies(page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
