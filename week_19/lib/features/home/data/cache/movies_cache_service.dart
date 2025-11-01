import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/cache/hive_cache_service.dart';
import '../models/all_movies_model.dart';

class MoviesCacheService implements HiveCacheService<AllMoviesModel> {
  static const String moviesBoxName = 'moviesBox';

  static Future<void> init() async {
    if (!Hive.isBoxOpen(moviesBoxName)) {
      await Hive.openBox<AllMoviesModel>(moviesBoxName);
    }
  }

  @override
  Future<void> cacheItem(String key, AllMoviesModel item) async {
    final box = Hive.box<AllMoviesModel>(moviesBoxName);
    await box.put(key, item);
  }

  @override
  AllMoviesModel? getCachedItem(String key) {
    final box = Hive.box<AllMoviesModel>(moviesBoxName);
    return box.get(key);
  }

  @override
  Future<void> clearCachedItem(String key) async {
    final box = Hive.box<AllMoviesModel>(moviesBoxName);
    await box.delete(key);
  }

  @override
  Future<void> clearAll() async {
    final box = Hive.box<AllMoviesModel>(moviesBoxName);
    await box.clear();
  }

  @override
  bool hasItem(String key) {
    final box = Hive.box<AllMoviesModel>(moviesBoxName);
    return box.containsKey(key);
  }

  Future<void> cacheMovies(AllMoviesModel movies) async {
    await cacheItem('cachedMovies', movies);
  }

  AllMoviesModel? getCachedMovies() {
    return getCachedItem('cachedMovies');
  }

  Future<void> clearCachedMovies() async {
    await clearCachedItem('cachedMovies');
  }

  Future<void> cacheMoviesByPage(int page, AllMoviesModel movies) async {
    await cacheItem('movies_page_$page', movies);
  }

  AllMoviesModel? getCachedMoviesByPage(int page) {
    return getCachedItem('movies_page_$page');
  }
}
