class MovieSearchResponse {
  int? page;
  List<MovieSearchResult>? results;
  int? totalPages;
  int? totalResults;

  MovieSearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieSearchResponse.fromJson(Map<String, dynamic> json) {
    return MovieSearchResponse(
      page: json['page'],
      results: (json['results'] as List?)
          ?.map((item) => MovieSearchResult.fromJson(item))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class MovieSearchResult {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieSearchResult({
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

  factory MovieSearchResult.fromJson(Map<String, dynamic> json) {
    return MovieSearchResult(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
