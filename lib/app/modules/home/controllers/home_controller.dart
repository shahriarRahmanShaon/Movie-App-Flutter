import 'package:get/get.dart';
import 'package:movie_base/app/data/model/top_rated_movie_response.dart';
import '/app/core/base/base_controller.dart';
import '/app/data/model/all_movie_response.dart';
import '/app/data/repository/movie_repository.dart';
import '/app/modules/home/model/home_ui_data.dart';

class HomeController extends BaseController {

  final MovieRepository _repository = Get.find(tag: (MovieRepository).toString());
  final RxList<AllMovieUiData> _allMovieListController = RxList.empty();
  List<AllMovieUiData> get projectList => _allMovieListController.toList();
  final RxList<TopMovieUiData> _topMovieListController = RxList.empty();
  List<TopMovieUiData> get topMovieList => _topMovieListController.toList();

  void getAllMovieList() {
    var movieService = _repository.getMovies();
    callDataService(
      movieService,
      onSuccess: _handleMovieListResponseSuccess,
    );
  }

  void getTopPickMovieList() {
    var topPickMovieService = _repository.getTopPickMovies();
    callDataService(
      topPickMovieService,
      onSuccess: _handleTopMovieListResponseSuccess,
    );
  }

  void _handleTopMovieListResponseSuccess(TopPickMovie response) {
    List<TopMovieUiData>? movieList = response.results?.map((e) => TopMovieUiData(
        originalTitle:  e.originalTitle != null ? e.originalTitle! : "Null")
    ).toList();
    var list = [...movieList!];
    _topMovieListController(list);

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
    _allMovieListController(list);
  }
}
