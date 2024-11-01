import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/core/values/app_colors.dart';
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
      appBarTitleText: 'Movie details',
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
                () => SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 60), // space for the button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackdropImage(),
                  Center(child: _movieNameHeaderView()),
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
                        _buildSpokenLanguages(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 0,
            child: _buildAddToWatchListButton(),
          ),
        ],
      ),
    );
  }

  Widget _movieNameHeaderView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        controller.movieDetailsUiData.title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.appBarColor,
        ),
        textAlign: TextAlign.center,
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
        const Text(
          'Overview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          controller.movieDetailsUiData.overview,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildGenres() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Genres:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
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
    return Row(
      children: [
        const Text(
          'Release Date:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Text(
          controller.movieDetailsUiData.releaseDate,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRuntime() {
    return Row(
      children: [
        const Text(
          'Runtime:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Text(
          '${controller.movieDetailsUiData.runtime} mins',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRatings() {
    return Row(
      children: [
        const Text(
          'Ratings:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.star, color: Colors.yellow, size: 24),
        Text(
          '${controller.movieDetailsUiData.voteAverage} (${controller.movieDetailsUiData.voteCount} votes)',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSpokenLanguages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Spoken Languages:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: controller.movieDetailsUiData.spokenLanguages
              .map((language) => Chip(label: Text(language.name)))
              .toList(),
        ),
      ],
    );
  }


  Widget _buildAddToWatchListButton() {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          _handleAddToFavourite();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          "Add to Favourite",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  void _handleAddToFavourite() async {
    controller.addToFavourite(isFavourite: true);
    Future.delayed(Duration(milliseconds: 1500), () {
      if (controller.addToFavSuccessOrNot) {
        _showSuccessDialog();
      }
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text(
              "Successfully added to the Favourite. Check your Favourite on the Favourite tab."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK", style: TextStyle(color: AppColors.appBarColor),),
            ),
          ],
        );
      },
    );
  }


  String _getUrlFromData(String posterPath) {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }
}
