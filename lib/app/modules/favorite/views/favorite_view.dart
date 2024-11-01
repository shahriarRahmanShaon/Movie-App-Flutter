import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../home/widget/movie_grid_view.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends BaseView<FavoriteController> {
  FavoriteView() {
    controller.getFavMovieList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() =>
    controller.favList.isEmpty
        ? Center(
      child: Text(
        "No favorites added",
        style: TextStyle(fontSize: 18),
      ),
    )
        : Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.padding * 1.5,
          vertical: AppValues.padding,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.65,
          ),
          itemCount: controller.favList.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.center,
              child: MovieGridView(movieUiData: controller.favList[index]),
            );
          },
        ),
      ),
    ),
    );
  }
}
