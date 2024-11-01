import 'package:get/get.dart';
import 'package:movie_base/app/data/model/fav_movie_list_response.dart';
import 'package:movie_base/app/data/repository/movie_repository.dart';
import 'package:movie_base/app/modules/favorite/model/fav_movie_ui_data.dart';
import '/app/core/base/base_controller.dart';

class FavoriteController extends BaseController {
  final MovieRepository _repository = Get.find(tag: (MovieRepository).toString());
  final RxList<FavMovieResultData> _favMovieListController = RxList.empty();
  List<FavMovieResultData> get favList => _favMovieListController.toList();

  void getFavMovieList() {
    var favMovieService = _repository.getFavMovies();
    callDataService(
      favMovieService,
      onSuccess: _handleFavMovieListResponseSuccess,
    );
  }

  void _handleFavMovieListResponseSuccess(FavMovieResponse response) {
    List<FavMovieResultData>? movieList = response.results?.map((movie) => FavMovieResultData(
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
    )).toList();

    var list = [...?movieList];
    _favMovieListController(list);
  }

}
