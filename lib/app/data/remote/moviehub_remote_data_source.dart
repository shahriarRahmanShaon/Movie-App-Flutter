import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import 'package:movie_base/app/data/model/upcoming_movie_response.dart';
import '/app/data/model/all_movie_response.dart';

abstract class MovieHubRemoteDataSource {
  Future<UpcomingMovie> getUpcomingMovies();
  Future<TopPickMovie> getTopPickMovies();
  Future<AllMoviesResponse> getMovies();
}
