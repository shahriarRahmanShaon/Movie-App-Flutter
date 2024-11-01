import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/core/values/app_values.dart';
import 'package:movie_base/app/core/values/text_styles.dart';
import 'package:movie_base/app/modules/home/widget/movie_grid_view.dart';
import 'package:movie_base/app/modules/home/widget/movie_header_view.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {

  HomeView() {
    controller.getTopPickMovieList();
    controller.getUpcomingMovieList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appLocalization.welcomeHomeText, style: primaryColorSubtitleStyle),
            const Text('Shahriar Rahman Shaon', style: centerTextStyle),
            const SizedBox(height: 20),
            MovieHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(appLocalization.topMoviePicks, style: centerTextStyle),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var movie in controller.topMovieList.take(AppValues.margin_10.toInt()))...[
                    MovieGridView(movieUiData: movie,key: key),
                    const SizedBox(width: 20),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:  const EdgeInsets.only(bottom: 8.0),
              child:  Text(appLocalization.upcomingMovies, style: centerTextStyle),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var movie in controller.upcomingMovieList.take(AppValues.margin_10.toInt()))...[
                    MovieGridView(movieUiData: movie,key: key),
                    const SizedBox(width: 20),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
