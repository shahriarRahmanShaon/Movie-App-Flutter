import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_base/app/core/values/app_values.dart';
import 'package:movie_base/app/core/values/text_styles.dart';
import 'package:movie_base/app/modules/home/widget/movie_grid_view.dart';
import 'package:movie_base/app/modules/home/widget/movie_header_view.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {

  HomeView() {
    controller.getAllMovieList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome Back', style: primaryColorSubtitleStyle),
            const Text('Shahriar Rahman', style: centerTextStyle,),
            const SizedBox(height: 20,),
            MovieHeader(),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Text('Top Movie Picks', style: centerTextStyle,),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
               children: [
                 MovieGridView(),
                 const SizedBox(width: 15,),
                 MovieGridView(),
                 const SizedBox(width: 15,),
                 MovieGridView(),
               ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Text('Upcoming Movies', style: centerTextStyle,),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MovieGridView(),
                  const SizedBox(width: 15,),
                  MovieGridView(),
                  const SizedBox(width: 15,),
                  MovieGridView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
