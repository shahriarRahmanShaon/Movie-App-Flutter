import 'package:flutter/material.dart';
import 'package:movie_base/app/core/values/app_values.dart';
import 'package:movie_base/app/core/values/text_styles.dart';
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
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Welcome Back', style: primaryColorSubtitleStyle),
          const Text('Shahriar Rahman', style: centerTextStyle,),
          const SizedBox(height: 20,),
          MovieHeader(),
        ],
      ),
    );
  }
}
