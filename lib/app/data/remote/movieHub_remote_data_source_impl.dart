import 'package:dio/dio.dart';
import 'package:movie_base/app/data/model/add_to_favourite_response.dart';
import 'package:movie_base/app/data/model/fav_movie_list_response.dart';
import 'package:movie_base/app/data/model/movie_details_response.dart';
import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import 'package:movie_base/app/data/model/upcoming_movie_response.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/core/model/add_to_favourite_query_param.dart';
import '/app/data/model/all_movie_response.dart';
import '/app/data/remote/moviehub_remote_data_source.dart';
import '/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements MovieHubRemoteDataSource {

  AllMoviesResponse _parseAllMoviesResponse(
      Response<dynamic> response) {
    return AllMoviesResponse.fromJson(response.data);
  }

  TopPickMovie _parseTopMoviesResponse(Response<dynamic> response) {
    return TopPickMovie.fromJson(response.data);
  }

  UpcomingMovie _parseUpcomingMoviesResponse(Response<dynamic> response) {
    return UpcomingMovie.fromJson(response.data);
  }

  MovieDetailsResponse _parseMovieDetailsResponse(Response<dynamic> response) {
    return MovieDetailsResponse.fromJson(response.data);
  }

  FavoriteResponse _parseFavouriteMovie(Response<dynamic> response) {
    return FavoriteResponse.fromJson(response.data);
  }

  FavMovieResponse _parseAllFavMovie(Response<dynamic> response) {
    return FavMovieResponse.fromJson(response.data);
  }

  @override
  Future<AllMoviesResponse> getMovies() {
    var endpoint = "${DioProvider.baseUrl}list_movies.json?sort_by=popular&order_by=desc";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAllMoviesResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopPickMovie> getTopPickMovies() {
    var endPoint = "${DioProvider.baseUrl}top_rated";
    var dioCall = dioClient.get(endPoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseTopMoviesResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpcomingMovie> getUpcomingMovies() {
    var endPoint = "${DioProvider.baseUrl}upcoming";
    var dioCall = dioClient.get(endPoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseUpcomingMoviesResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) {
    var endPoint = "${DioProvider.baseUrl}$movieId";
    var dioCall = dioClient.get(endPoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseMovieDetailsResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FavoriteResponse> addToFavourite(AddToFavouriteQueryParam queryParam) {
    var endpoint = "https://api.themoviedb.org/3/account/12666036/favorite";
    var dioCall = dioClient.post(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseFavouriteMovie(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FavMovieResponse> getFavMovies() {
    var endpoint = "https://api.themoviedb.org/3/account/12666036/favorite/movies";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAllFavMovie(response));
    } catch (e) {
      rethrow;
    }
  }

}
