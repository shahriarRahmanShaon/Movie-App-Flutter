import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/core/values/app_colors.dart';
import 'package:movie_base/app/core/values/app_values.dart';
import 'package:movie_base/app/core/values/text_styles.dart';
import 'package:movie_base/app/core/widget/custom_app_bar.dart';
import 'package:movie_base/app/core/widget/icon_text_widgets.dart';
import 'package:movie_base/app/modules/project_details/controllers/movie_details_controller.dart';

import '../../../core/base/base_view.dart';

class ProjectDetailsView extends BaseView<MovieDetailsController> {
  ProjectDetailsView() {
    controller.getMovieDetails();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Movie Details',
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
              Image.network(
                _getUrlFromData(controller.movieDetailsUiData.backdropPath),
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getUrlFromData(String posterPath) {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }
}
