import 'package:get/get.dart';
import 'package:movie_base/app/core/model/add_to_favourite_query_param.dart';
import 'package:movie_base/app/data/model/add_to_favourite_response.dart';
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
  final RxBool _addToFavResponse = RxBool(false);
  bool get addToFavSuccessOrNot => _addToFavResponse.value;

  void getMovieDetails() {
    int id = Get.arguments;
    var detailsMovieService = _repository.getMovieDetails(id);
    callDataService(
      detailsMovieService,
      onSuccess: _handleMovieDetailsResponseSuccess,
    );
  }

  void addToFavourite({bool isFavourite = false}) {
    int id = Get.arguments;
    var queryParam = AddToFavouriteQueryParam(mediaId: id.toString(), favorite: isFavourite);

    var movieDetailsService = _repository.addToFavourite(queryParam);
    callDataService(
      movieDetailsService,
      onSuccess: _handleAddToFavouriteResponseSuccess,
    );
  }

  void _handleAddToFavouriteResponseSuccess(FavoriteResponse response) {
    _addToFavResponse(response.success);
  }

  void _handleMovieDetailsResponseSuccess(MovieDetailsResponse response) {
    _detailsUiData(MovieDetailsUiData(
      backdropPath: response.backdropPath ?? "",
      belongsToCollection: response.belongsToCollection != null ? response.belongsToCollection.toString() : "",
      budget: response.budget ?? 0,
      genres: response.genres != null
          ? response.genres!.map((genre) => GenresUiData(id: genre.id ?? 0, name: genre.name ?? "")).toList()
          : [],
      homepage: response.homepage ?? "",
      id: response.id ?? 0,
      imdbId: response.imdbId ?? "",
      originCountry: response.originCountry ?? [],
      originalLanguage: response.originalLanguage ?? "",
      originalTitle: response.originalTitle ?? "",
      overview: response.overview ?? "",
      popularity: response.popularity ?? 0.0,
      posterPath: response.posterPath ?? "",
      productionCompanies: response.productionCompanies != null
          ? response.productionCompanies!.map((company) => ProductionCompaniesUiData(
        id: company.id ?? 0,
        logoPath: company.logoPath ?? "",
        name: company.name ?? "",
        originCountry: company.originCountry ?? "",
      )).toList()
          : [],
      productionCountries: response.productionCountries != null
          ? response.productionCountries!.map((country) => ProductionCountriesUiData(
        iso31661: country.iso31661 ?? "",
        name: country.name ?? "",
      )).toList()
          : [],
      releaseDate: response.releaseDate ?? "",
      revenue: response.revenue ?? 0,
      runtime: response.runtime ?? 0,
      spokenLanguages: response.spokenLanguages != null
          ? response.spokenLanguages!.map((language) => SpokenLanguagesUiData(
        englishName: language.englishName ?? "",
        iso6391: language.iso6391 ?? "",
        name: language.name ?? "",
      )).toList()
          : [],
      status: response.status ?? "",
      tagline: response.tagline ?? "",
      title: response.title ?? "",
      video: response.video ?? false,
      voteAverage: response.voteAverage ?? 0.0,
      voteCount: response.voteCount ?? 0,
    ));
  }

}
