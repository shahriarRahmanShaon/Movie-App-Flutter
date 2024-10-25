import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '/app/modules/home/model/github_project_ui_data.dart';

class HomeController extends BaseController {
  final GithubRepository _repository =
  Get.find(tag: (GithubRepository).toString());

  final RxList<GithubProjectUiData> _githubProjectListController =
  RxList.empty();

  List<GithubProjectUiData> get projectList =>
      _githubProjectListController.toList();

  void getGithubGetxProjectList() {

    // var queryParam = GithubSearchQueryParam(
    //   searchKeyWord: 'flutter getx template',
    //   pageNumber: 1,
    // );

    var githubRepoSearchService = _repository.getMovies();
    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

  }

  void _handleProjectListResponseSuccess(GithubProjectSearchResponse response) {
    print(response.statusMessage ?? "");
    List<GithubProjectUiData>? repoList = response.data?.movies
        ?.map((e) => GithubProjectUiData(
      id: e.id != null ? e.id! : 0,
      url: e.url != null ? e.url! : "Null",
      imdbCode: e.imdbCode != null ? e.imdbCode! : "Null",
      title: e.title != null ? e.title! : "Null",
      titleEnglish: e.titleEnglish != null ? e.titleEnglish! : "Null",
    ))
        .toList();
    var list = [...repoList!];
    _githubProjectListController(list);
  }
}
