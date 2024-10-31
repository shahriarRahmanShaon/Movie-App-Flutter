class MovieDetailsUiData {
  String backdropPath;
  String belongsToCollection;
  int budget;
  List<GenresUiData> genres;
  String homepage;
  int id;
  String imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompaniesUiData> productionCompanies;
  List<ProductionCountriesUiData> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguagesUiData> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailsUiData({
    this.backdropPath = '',
    this.belongsToCollection = '',
    this.budget = 0,
    this.genres = const [],
    this.homepage = '',
    this.id = 0,
    this.imdbId = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.releaseDate = '',
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}

class GenresUiData {
  int id;
  String name;

  GenresUiData({this.id = 0, this.name = ''});
}

class ProductionCompaniesUiData {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompaniesUiData({
    this.id = 0,
    this.logoPath = '',
    this.name = '',
    this.originCountry = '',
  });
}

class ProductionCountriesUiData {
  String iso31661;
  String name;

  ProductionCountriesUiData({this.iso31661 = '', this.name = ''});
}

class SpokenLanguagesUiData {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguagesUiData({
    this.englishName = '',
    this.iso6391 = '',
    this.name = '',
  });
}
