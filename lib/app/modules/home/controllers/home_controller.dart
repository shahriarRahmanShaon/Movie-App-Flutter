import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/all_movie_response.dart';
import '/app/data/repository/movie_repository.dart';
import '/app/modules/home/model/home_ui_data.dart';

class HomeController extends BaseController {
  final MovieRepository _repository =
  Get.find(tag: (MovieRepository).toString());

  final RxList<AllMovieUiData> _githubProjectListController =
  RxList.empty();

  List<AllMovieUiData> get projectList =>
      _githubProjectListController.toList();

  void getAllMovieList() {
    var movieService = _repository.getMovies();
    callDataService(
      movieService,
      onSuccess: _handleMovieListResponseSuccess,
    );

  }

  void _handleMovieListResponseSuccess(AllMoviesResponse response) {
    List<AllMovieUiData>? repoList = response.data?.movies
        ?.map((e) => AllMovieUiData(
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
