import 'package:movie_base/app/data/model/movie_details_response.dart';
import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import 'package:movie_base/app/data/model/upcoming_movie_response.dart';

import '/app/core/model/movie_details_query_param.dart';
import '/app/data/model/all_movie_response.dart';

abstract class MovieRepository {
  Future<AllMoviesResponse> getMovies();
  Future<TopPickMovie> getTopPickMovies();
  Future<UpcomingMovie> getUpcomingMovies();
  Future<MovieDetailsResponse> getMovieDetails(int movieId);
}
