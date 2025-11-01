import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState<T> with _$MovieDetailsState<T> {
  const factory MovieDetailsState.idle() = Idle<T>;
  const factory MovieDetailsState.loading() = Loading<T>;
  const factory MovieDetailsState.success({
    required T movieDetails,
    required bool isFromCache,
  }) = Success<T>;
  const factory MovieDetailsState.error({required String error}) = Error;
}
