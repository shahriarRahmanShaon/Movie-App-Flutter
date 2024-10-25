import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class ProjectDetailsController extends BaseController {
  final GithubRepository _repository =
      Get.find(tag: (GithubRepository).toString());

  final Rx<GithubProjectUiData> _projectUiData = GithubProjectUiData().obs;

  GithubProjectUiData get projectUiData => _projectUiData.value;


}
