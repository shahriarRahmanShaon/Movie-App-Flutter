import 'package:get/get.dart';
import 'package:movie_base/app/core/base/base_controller.dart';
import 'package:movie_base/app/core/model/movie_search_query_param.dart';
import 'package:movie_base/app/data/model/search_movie_response.dart';
import 'package:movie_base/app/data/repository/movie_repository.dart';
import 'package:movie_base/app/modules/search/model/movie_search_ui_data.dart';

class SearchController extends BaseController {
  final MovieRepository _repository = Get.find(tag: (MovieRepository).toString());
  final RxList<MovieSearchUiData> _searchUiData = RxList.empty();
  List<MovieSearchUiData> get searchedMovieUiData => _searchUiData.toList();

  void search(String movieInput) {
    var queryParam = MovieSearchQueryParam(query: movieInput);

    var movieDetailsService = _repository.getSearchMovie(queryParam);
    callDataService(
      movieDetailsService,
      onSuccess: _handleMovieSearchResponseSuccess,
    );
  }

  void _handleMovieSearchResponseSuccess(MovieSearchResponse response) {
    List<MovieSearchUiData> uiDataList = response.results?.map((movie) {
      return MovieSearchUiData(
        adult: movie.adult ?? false,
        backdropPath: movie.backdropPath ?? '',
        genreIds: movie.genreIds ?? [],
        id: movie.id ?? 0,
        originalLanguage: movie.originalLanguage ?? '',
        originalTitle: movie.originalTitle ?? '',
        overview: movie.overview ?? '',
        popularity: movie.popularity ?? 0.0,
        posterPath: movie.posterPath ?? '',
        releaseDate: movie.releaseDate ?? '',
        title: movie.title ?? '',
        video: movie.video ?? false,
        voteAverage: movie.voteAverage ?? 0.0,
        voteCount: movie.voteCount ?? 0,
      );
    }).toList() ?? [];
    var list = [...uiDataList];
    _searchUiData(list);
  }

}
