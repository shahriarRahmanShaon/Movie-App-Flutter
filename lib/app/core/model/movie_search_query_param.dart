class MovieSearchQueryParam {
  String query;
  bool includeAdult;
  String language;
  int page;

  MovieSearchQueryParam({
    required this.query,
    this.includeAdult = false,
    this.language = "en-US",
    this.page = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'query': query,
      'include_adult': includeAdult.toString(),
      'language': language,
      'page': page.toString(),
    };
  }
}
