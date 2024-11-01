import 'package:get/get.dart';
import 'package:movie_base/app/core/model/movie_search_query_param.dart';
import 'package:movie_base/app/data/model/add_to_favourite_response.dart';
import 'package:movie_base/app/data/model/fav_movie_list_response.dart';
import 'package:movie_base/app/data/model/movie_details_response.dart';
import 'package:movie_base/app/data/model/search_movie_response.dart';
import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import 'package:movie_base/app/data/model/upcoming_movie_response.dart';

import '/app/core/model/add_to_favourite_query_param.dart';
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

  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) {
    return _remoteSource.getMovieDetails(movieId);
  }

  @override
  Future<FavoriteResponse> addToFavourite(AddToFavouriteQueryParam queryParam) {
    return _remoteSource.addToFavourite(queryParam);
  }

  @override
  Future<FavMovieResponse> getFavMovies() {
    return _remoteSource.getFavMovies();
  }

  @override
  Future<MovieSearchResponse> getSearchMovie(MovieSearchQueryParam queryParam) {
    return _remoteSource.getSearchMovie(queryParam);
  }
}
