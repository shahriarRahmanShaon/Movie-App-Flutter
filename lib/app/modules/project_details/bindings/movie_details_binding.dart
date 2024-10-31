import 'package:get/get.dart';

import '/app/modules/project_details/controllers/movie_details_controller.dart';

class ProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(
      () => MovieDetailsController(),
    );
  }
}
