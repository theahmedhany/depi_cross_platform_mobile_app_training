import 'package:week_19/features/details/data/models/movie_details_model.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class MovieDetailsRepo {
  final ApiServices apiServices;

  MovieDetailsRepo(this.apiServices);

  Future<ApiResult<MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      var response = await apiServices.movieDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
