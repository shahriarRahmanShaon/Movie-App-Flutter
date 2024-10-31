import 'package:get/get.dart';
import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import 'package:movie_base/app/data/model/upcoming_movie_response.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/all_movie_response.dart';
import '/app/data/remote/moviehub_remote_data_source.dart';
import '/app/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieHubRemoteDataSource _remoteSource =
      Get.find(tag: (MovieHubRemoteDataSource).toString());

  @override
  Future<AllMoviesResponse> getMovies() {
    return _remoteSource.getMovies();
  }

  @override
  Future<TopPickMovie> getTopPickMovies() {
    return _remoteSource.getTopPickMovies();
  }

  @override
  Future<UpcomingMovie> getUpcomingMovies() {
    return _remoteSource.getUpcomingMovies();
  }
}
