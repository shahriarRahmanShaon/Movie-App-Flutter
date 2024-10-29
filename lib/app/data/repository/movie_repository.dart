import 'package:movie_base/app/data/model/top_rated_movie_response.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/all_movie_response.dart';

abstract class MovieRepository {
  Future<AllMoviesResponse> getMovies();
  Future<TopPickMovie> getTopPickMovies();
}
