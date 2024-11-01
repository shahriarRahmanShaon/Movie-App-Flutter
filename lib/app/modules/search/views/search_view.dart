import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/core/base/base_view.dart';
import 'package:movie_base/app/core/values/app_colors.dart';
import '/app/modules/search/controllers/search_controller.dart' as searchController;
import '../../home/widget/movie_grid_view.dart';
import '/app/core/values/app_values.dart';

class SearchView extends BaseView<searchController.SearchController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildSearchField(context),
          Expanded(
            child: Obx(
                  () => controller.searchedMovieUiData.isEmpty
                  ? const Center(
                child: Text(
                  "No results found",
                  style: TextStyle(fontSize: 18),
                ),
              )
                  : Padding(
                padding: const EdgeInsets.all(AppValues.padding),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: controller.searchedMovieUiData.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: MovieGridView(movieUiData: controller.searchedMovieUiData[index]),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: TextField(
        onChanged: (query) {
          controller.search(query);
        },
        decoration: InputDecoration(
          hintText: "Search movies...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.appBarColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.appBarColor,
            ),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.appBarColor),
        ),
      ),
    );
  }
}
