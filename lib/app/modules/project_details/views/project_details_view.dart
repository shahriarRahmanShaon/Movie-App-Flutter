import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/core/widget/custom_app_bar.dart';
import 'package:movie_base/app/modules/project_details/controllers/movie_details_controller.dart';
import '../../../core/base/base_view.dart';

class ProjectDetailsView extends BaseView<MovieDetailsController> {
  ProjectDetailsView() {
    controller.getMovieDetails();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Repository details',
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackdropImage(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOverview(),
                    SizedBox(height: 16),
                    _buildGenres(),
                    SizedBox(height: 16),
                    _buildReleaseDate(),
                    SizedBox(height: 16),
                    _buildRuntime(),
                    SizedBox(height: 16),
                    _buildRatings(),
                    SizedBox(height: 16),
                    _buildProductionCompanies(),
                    SizedBox(height: 16),
                    _buildSpokenLanguages(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackdropImage() {
    return Image.network(
      _getUrlFromData(controller.movieDetailsUiData.backdropPath),
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }

  Widget _buildOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          controller.movieDetailsUiData.overview,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildGenres() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genres',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: controller.movieDetailsUiData.genres
              .map((genre) => Chip(label: Text(genre.name)))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildReleaseDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Release Date',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          controller.movieDetailsUiData.releaseDate,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRuntime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Runtime',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '${controller.movieDetailsUiData.runtime} mins',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRatings() {
    return Row(
      children: [
        Text(
          'Ratings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Icon(Icons.star, color: Colors.yellow, size: 24),
        Text(
          '${controller.movieDetailsUiData.voteAverage} (${controller.movieDetailsUiData.voteCount} votes)',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildProductionCompanies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Production Companies',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.movieDetailsUiData.productionCompanies
              .map((company) => Text(company.name))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSpokenLanguages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spoken Languages',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: controller.movieDetailsUiData.spokenLanguages
              .map((language) => Chip(label: Text(language.name)))
              .toList(),
        ),
      ],
    );
  }

  String _getUrlFromData(String posterPath) {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }
}
