import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_19/features/details/data/cache/movie_details_cache_service.dart';
import 'package:week_19/features/details/data/models/movie_details_model.dart';
import 'package:week_19/features/details/data/repos/movie_details_repo.dart';
import 'package:week_19/features/details/presentation/logic/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState<MovieDetailsModel>> {
  final MovieDetailsRepo movieDetailsRepo;
  final MovieDetailsCacheService movieDetailsCacheService;

  MovieDetailsCubit(this.movieDetailsRepo, this.movieDetailsCacheService)
    : super(const Idle());

  void emitGetMovieDetails(int id) async {
    emit(const MovieDetailsState.loading());

    try {
      final cachedMovieDetails = movieDetailsCacheService.getCachedMovieDetails(
        id,
      );

      if (cachedMovieDetails != null) {
        emit(
          MovieDetailsState.success(
            movieDetails: cachedMovieDetails,
            isFromCache: true,
          ),
        );
      }

      final result = await movieDetailsRepo.getMovieDetails(id);

      result.when(
        success: (MovieDetailsModel movieDetails) {
          movieDetailsCacheService.cacheMovieDetails(id, movieDetails);

          emit(
            MovieDetailsState.success(
              movieDetails: movieDetails,
              isFromCache: false,
            ),
          );
        },
        failure: (error) {
          if (cachedMovieDetails == null) {
            final errorMessage =
                error.statusMessage ?? 'Failed to load movie details';
            emit(MovieDetailsState.error(error: errorMessage));
          }
        },
      );
    } catch (e) {
      final cachedMovieDetails = movieDetailsCacheService.getCachedMovieDetails(
        id,
      );
      if (cachedMovieDetails != null) {
        emit(
          MovieDetailsState.success(
            movieDetails: cachedMovieDetails,
            isFromCache: true,
          ),
        );
      } else {
        emit(MovieDetailsState.error(error: e.toString()));
      }
    }
  }
}
