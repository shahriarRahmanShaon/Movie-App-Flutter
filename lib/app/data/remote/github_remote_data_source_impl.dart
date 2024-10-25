import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/github_remote_data_source.dart';
import '/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements GithubRemoteDataSource {
  // @override
  // Future<GithubProjectSearchResponse> searchGithubProject() {
  //   var endpoint = "${DioProvider.baseUrl}list_movies.json?sort_by=popular&order_by=desc";
  //   var dioCall = dioClient.get(endpoint);
  //
  //   try {
  //     return callApiWithErrorParser(dioCall)
  //         .then((response) => _parseGithubProjectSearchResponse(response));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<Item> getGithubProjectDetails(String userName, String repositoryName) {
  //   var endpoint = "${DioProvider.baseUrl}/repos/$userName/$repositoryName";
  //   var dioCall = dioClient.get(endpoint);
  //
  //   try {
  //     return callApiWithErrorParser(dioCall)
  //         .then((response) => _parseGithubProjectResponse(response));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  GithubProjectSearchResponse _parseGithubProjectSearchResponse(
      Response<dynamic> response) {
    return GithubProjectSearchResponse.fromJson(response.data);
  }

  @override
  Future<GithubProjectSearchResponse> getMovies() {
    var endpoint = "${DioProvider.baseUrl}list_movies.json?sort_by=popular&order_by=desc";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubProjectSearchResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  // Item _parseGithubProjectResponse(Response<dynamic> response) {
  //   return Item.fromJson(response.data);
  // }

}
