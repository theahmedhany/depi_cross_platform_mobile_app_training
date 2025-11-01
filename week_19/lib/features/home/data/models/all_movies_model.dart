import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_movies_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class AllMoviesModel extends HiveObject {
  @HiveField(0)
  final int? page;

  @HiveField(1)
  final List<MovieModel>? results;

  @HiveField(2)
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @HiveField(3)
  @JsonKey(name: 'total_results')
  final int? totalResults;

  AllMoviesModel({this.page, this.results, this.totalPages, this.totalResults});

  factory AllMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$AllMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllMoviesModelToJson(this);

  AllMoviesModel copyWith({
    int? page,
    List<MovieModel>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return AllMoviesModel(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

@HiveType(typeId: 1)
@JsonSerializable()
class MovieModel extends HiveObject {
  @HiveField(0)
  final bool? adult;

  @HiveField(1)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @HiveField(2)
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @HiveField(3)
  final int? id;

  @HiveField(4)
  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @HiveField(5)
  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @HiveField(6)
  final String? overview;

  @HiveField(7)
  final double? popularity;

  @HiveField(8)
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @HiveField(9)
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @HiveField(10)
  final String? title;

  @HiveField(11)
  final bool? video;

  @HiveField(12)
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @HiveField(13)
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  String toString() =>
      'MovieModel(id: $id, title: $title, releaseDate: $releaseDate)';
}
