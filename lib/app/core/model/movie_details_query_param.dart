import '/app/core/values/app_values.dart';

class MovieDetailsQueryParam {
  int movieId;

  MovieDetailsQueryParam({
    required this.movieId
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['movie_id'] = movieId;

    return data;
  }
}
