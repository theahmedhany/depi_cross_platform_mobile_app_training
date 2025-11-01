import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_movies_state.freezed.dart';

@freezed
class AllMoviesState<T> with _$AllMoviesState<T> {
  const factory AllMoviesState.idle() = Idle<T>;
  const factory AllMoviesState.loading() = Loading<T>;
  const factory AllMoviesState.success({
    required T allMovies,
    required bool isFromCache,
  }) = Success<T>;
  const factory AllMoviesState.loadingMore({required T allMovies}) =
      LoadingMore<T>;
  const factory AllMoviesState.error({required String error}) = Error;
}
