import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_19/features/home/data/cache/movies_cache_service.dart';
import 'package:week_19/features/home/data/models/all_movies_model.dart';
import 'package:week_19/features/home/data/repos/all_movies_repo.dart';
import 'package:week_19/features/home/presentation/logic/all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState<AllMoviesModel>> {
  final AllMoviesRepo allMoviesRepo;
  final MoviesCacheService moviesCacheService;

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMorePages = true;
  List<MovieModel> _allMovies = [];

  AllMoviesCubit(this.allMoviesRepo, this.moviesCacheService)
    : super(const Idle());

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMorePages => _hasMorePages;
  int get currentPage => _currentPage;

  void emitGetAllMovies() async {
    emit(const AllMoviesState.loading());

    try {
      final cachedAllMovies = moviesCacheService.getCachedMovies();

      if (cachedAllMovies != null && cachedAllMovies.results != null) {
        _allMovies = List.from(cachedAllMovies.results!);
        _currentPage = cachedAllMovies.page ?? 1;
        _hasMorePages = (_currentPage < (cachedAllMovies.totalPages ?? 1));

        emit(
          AllMoviesState.success(allMovies: cachedAllMovies, isFromCache: true),
        );
      }

      final result = await allMoviesRepo.getAllMovies('1');

      result.when(
        success: (AllMoviesModel allMovies) async {
          await moviesCacheService.cacheMovies(allMovies.copyWith());
          await moviesCacheService.cacheMoviesByPage(1, allMovies.copyWith());

          _allMovies = List.from(allMovies.results ?? []);
          _currentPage = allMovies.page ?? 1;
          _hasMorePages = (_currentPage < (allMovies.totalPages ?? 1));

          emit(
            AllMoviesState.success(allMovies: allMovies, isFromCache: false),
          );
        },
        failure: (error) {
          if (cachedAllMovies != null) {
            return;
          }

          final errorMessage =
              error.statusMessage ?? 'Failed to load movies. Please try again.';
          emit(AllMoviesState.error(error: errorMessage));
        },
      );
    } catch (e) {
      final cachedAllMovies = moviesCacheService.getCachedMovies();
      if (cachedAllMovies != null && cachedAllMovies.results != null) {
        _allMovies = List.from(cachedAllMovies.results!);
        _currentPage = cachedAllMovies.page ?? 1;
        _hasMorePages = (_currentPage < (cachedAllMovies.totalPages ?? 1));

        emit(
          AllMoviesState.success(allMovies: cachedAllMovies, isFromCache: true),
        );
      } else {
        emit(AllMoviesState.error(error: e.toString()));
      }
    }
  }

  Future<void> loadMoreMovies() async {
    if (_isLoadingMore || !_hasMorePages) return;

    _isLoadingMore = true;
    final nextPage = _currentPage + 1;

    final currentMovies = AllMoviesModel(
      page: _currentPage,
      results: _allMovies,
      totalPages: null,
      totalResults: null,
    );
    emit(AllMoviesState.loadingMore(allMovies: currentMovies));

    try {
      final cachedPageMovies = moviesCacheService.getCachedMoviesByPage(
        nextPage,
      );

      if (cachedPageMovies != null && cachedPageMovies.results != null) {
        _allMovies.addAll(cachedPageMovies.results!);
        _currentPage = nextPage;
        _hasMorePages =
            (_currentPage < (cachedPageMovies.totalPages ?? _currentPage));

        final combinedMovies = AllMoviesModel(
          page: _currentPage,
          results: _allMovies,
          totalPages: cachedPageMovies.totalPages,
          totalResults: cachedPageMovies.totalResults,
        );

        emit(
          AllMoviesState.success(allMovies: combinedMovies, isFromCache: true),
        );
      }

      final result = await allMoviesRepo.getAllMovies(nextPage.toString());

      result.when(
        success: (AllMoviesModel newMovies) async {
          if (newMovies.results != null) {
            await moviesCacheService.cacheMoviesByPage(nextPage, newMovies);

            final newMovieIds = _allMovies.map((m) => m.id).toSet();
            final uniqueNewMovies = newMovies.results!
                .where((movie) => !newMovieIds.contains(movie.id))
                .toList();

            _allMovies.addAll(uniqueNewMovies);
            _currentPage = nextPage;
            _hasMorePages =
                (_currentPage < (newMovies.totalPages ?? _currentPage));

            final combinedMovies = AllMoviesModel(
              page: _currentPage,
              results: _allMovies,
              totalPages: newMovies.totalPages,
              totalResults: newMovies.totalResults,
            );

            await moviesCacheService.cacheMovies(combinedMovies.copyWith());

            emit(
              AllMoviesState.success(
                allMovies: combinedMovies,
                isFromCache: false,
              ),
            );
          }
        },
        failure: (error) {
          if (cachedPageMovies == null) {}
        },
      );
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> refreshMovies() async {
    _currentPage = 1;
    _allMovies.clear();
    _hasMorePages = true;
    emitGetAllMovies();
  }

  void resetPagination() {
    _currentPage = 1;
    _allMovies.clear();
    _hasMorePages = true;
    _isLoadingMore = false;
  }
}
