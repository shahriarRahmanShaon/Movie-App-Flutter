class UpcomingMovie {
  int? page;
  List<UpcomingMovieResults>? results;
  int? totalPages;
  int? totalResults;

  UpcomingMovie({this.page, this.results, this.totalPages, this.totalResults});

  UpcomingMovie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <UpcomingMovieResults>[];
      json['results'].forEach((v) {
        results!.add(UpcomingMovieResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class UpcomingMovieResults {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;

  UpcomingMovieResults(
      {
        this.backdropPath,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
      });

  UpcomingMovieResults.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
  }
}
