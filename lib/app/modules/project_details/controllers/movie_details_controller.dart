import 'package:get/get.dart';
import 'package:movie_base/app/data/model/movie_details_response.dart';
import 'package:movie_base/app/modules/project_details/model/movie_detail_ui_data.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/model/all_movie_response.dart';
import '/app/data/repository/movie_repository.dart';
import '/app/modules/home/model/home_ui_data.dart';

class MovieDetailsController extends BaseController {
  final MovieRepository _repository = Get.find(tag: (MovieRepository).toString());
  final Rx<MovieDetailsUiData> _detailsUiData = MovieDetailsUiData().obs;
  MovieDetailsUiData get movieDetailsUiData => _detailsUiData.value;

  void getMovieDetails() {
    int id = Get.arguments;
    var detailsMovieService = _repository.getMovieDetails(id);
    callDataService(
      detailsMovieService,
      onSuccess: _handleMovieDetailsResponseSuccess,
    );
  }

  void _handleMovieDetailsResponseSuccess(MovieDetailsResponse response) {
    _detailsUiData(MovieDetailsUiData(
      posterPath: response.posterPath != null ? response.posterPath! : "",
      imdbId: response.imdbId != null ? response.imdbId! : "",
      backdropPath: response.backdropPath != null ? response.backdropPath! : "null"
    ));

  }

}
