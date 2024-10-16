import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/core/base/base_view.dart';
import '/app/modules/search/controllers/search_controller.dart' as searchController;

class SearchView extends BaseView<searchController.SearchController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Text('hi');
  }
}
