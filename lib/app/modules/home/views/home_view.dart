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
            const Text('Welcome Back', style: primaryColorSubtitleStyle),
            const Text('Shahriar Rahman Shaon', style: centerTextStyle),
            const SizedBox(height: 20),
            MovieHeader(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Top Movie Picks', style: centerTextStyle),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var movie in controller.topMovieList.take(10))...[
                    MovieGridView(movieUiData: movie,key: key),
                    const SizedBox(width: 20),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Text('Upcoming Movies', style: centerTextStyle),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text("fefefe")
                  // MovieGridView(),
                  // const SizedBox(width: 15),
                  // MovieGridView(),
                  // const SizedBox(width: 15),
                  // MovieGridView(movieUiData: m,),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
