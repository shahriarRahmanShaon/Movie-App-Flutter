class AllMovieUiData {
  int id;
  String url;
  String imdbCode;
  String title;
  String titleEnglish;
  // String titleLong;
  // String slug;
  // int year;
  // double rating;
  // int runtime;
  // List<String> genres;
  // String summary;
  // String descriptionFull;
  // String synopsis;
  // String ytTrailerCode;
  // String language;
  // String mpaRating;
  // String backgroundImage;
  // String backgroundImageOriginal;
  // String smallCoverImage;
  // String mediumCoverImage;
  // String largeCoverImage;
  // String state;
  // String dateUploaded;
  // int dateUploadedUnix;

  AllMovieUiData({
    this.id = 0,
    this.url = "",
    this.imdbCode = "",
    this.title = "",
    this.titleEnglish = "",
    // this.titleLong,
    // this.slug,
    // this.year,
    // this.rating,
    // this.runtime,
    // this.genres,
    // this.summary,
    // this.descriptionFull,
    // this.synopsis,
    // this.ytTrailerCode,
    // this.language,
    // this.mpaRating,
    // this.backgroundImage,
    // this.backgroundImageOriginal,
    // this.smallCoverImage,
    // this.mediumCoverImage,
    // this.largeCoverImage,
    // this.state,
    // this.dateUploaded,
    // this.dateUploadedUnix
  });
}

class TopMovieUiData {
  int id;
  String originalTitle;
  String posterPath;
  String releaseDate;
  double popularity;
  String overview;
  String backdropPath;
  String originalLanguage;
  String title;

  TopMovieUiData({
    this.id = 0,
    this.originalTitle = "Null",
    this.posterPath = "NUll",
    this.releaseDate = "Null",
    this.popularity = 5.0,
    this.overview = "Null",
    this.backdropPath = "Null",
    this.originalLanguage = "Null",
    this.title = "Null",
  });
}

class UpcomingMovieUiData {
  int id;
  String originalTitle;
  String posterPath;
  String releaseDate;
  double popularity;
  String overview;
  String backdropPath;
  String originalLanguage;
  String title;

  UpcomingMovieUiData({
    this.id = 0,
    this.originalTitle = "Null",
    this.posterPath = "NUll",
    this.releaseDate = "Null",
    this.popularity = 5.0,
    this.overview = "Null",
    this.backdropPath = "Null",
    this.originalLanguage = "Null",
    this.title = "Null",
  });
}


