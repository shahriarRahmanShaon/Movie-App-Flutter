import 'package:movie_base/app/core/model/movie_details_query_param.dart';
import 'package:movie_base/app/data/model/movie_details_response.dart';
import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import 'package:movie_base/app/data/model/upcoming_movie_response.dart';
import '/app/data/model/all_movie_response.dart';

abstract class MovieHubRemoteDataSource {
  Future<UpcomingMovie> getUpcomingMovies();
  Future<TopPickMovie> getTopPickMovies();
  Future<AllMoviesResponse> getMovies();
  Future<MovieDetailsResponse> getMovieDetails(int movieId);
}
