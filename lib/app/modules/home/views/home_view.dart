import 'package:flutter/material.dart';
import 'package:movie_base/app/modules/home/widget/item_github_project.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        MovieHeader()
      ],
    );
  }
}
