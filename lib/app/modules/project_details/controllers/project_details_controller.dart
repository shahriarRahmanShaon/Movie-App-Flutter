import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/model/all_movie_response.dart';
import '/app/data/repository/movie_repository.dart';
import '/app/modules/home/model/home_ui_data.dart';

class ProjectDetailsController extends BaseController {
  final MovieRepository _repository =
      Get.find(tag: (MovieRepository).toString());

  final Rx<AllMovieUiData> _projectUiData = AllMovieUiData().obs;

  AllMovieUiData get projectUiData => _projectUiData.value;


}
