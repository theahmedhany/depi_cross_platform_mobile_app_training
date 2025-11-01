import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class MovieDetailsModel extends HiveObject {
  @HiveField(0)
  final bool? adult;

  @HiveField(1)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @HiveField(2)
  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;

  @HiveField(3)
  final int? budget;

  @HiveField(4)
  final List<Genre>? genres;

  @HiveField(5)
  final String? homepage;

  @HiveField(6)
  final int? id;

  @HiveField(7)
  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @HiveField(8)
  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;

  @HiveField(9)
  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @HiveField(10)
  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @HiveField(11)
  final String? overview;

  @HiveField(12)
  final double? popularity;

  @HiveField(13)
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @HiveField(14)
  @JsonKey(name: 'production_companies')
  final List<ProductionCompany>? productionCompanies;

  @HiveField(15)
  @JsonKey(name: 'production_countries')
  final List<ProductionCountry>? productionCountries;

  @HiveField(16)
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @HiveField(17)
  final int? revenue;

  @HiveField(18)
  final int? runtime;

  @HiveField(19)
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage>? spokenLanguages;

  @HiveField(20)
  final String? status;

  @HiveField(21)
  final String? tagline;

  @HiveField(22)
  final String? title;

  @HiveField(23)
  final bool? video;

  @HiveField(24)
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @HiveField(25)
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class Genre extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class ProductionCompany extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@HiveType(typeId: 5)
@JsonSerializable()
class ProductionCountry extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'iso_3166_1')
  final String? iso3166_1;

  @HiveField(1)
  final String? name;

  ProductionCountry({this.iso3166_1, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@HiveType(typeId: 6)
@JsonSerializable()
class SpokenLanguage extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'english_name')
  final String? englishName;

  @HiveField(1)
  @JsonKey(name: 'iso_639_1')
  final String? iso639_1;

  @HiveField(2)
  final String? name;

  SpokenLanguage({this.englishName, this.iso639_1, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
