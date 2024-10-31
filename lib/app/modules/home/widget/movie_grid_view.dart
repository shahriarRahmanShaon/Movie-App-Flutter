import 'package:get/get.dart';
import 'package:movie_base/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/app/core/values/app_values.dart';

import '../../../routes/app_pages.dart';

class MovieGridView extends StatelessWidget with BaseWidgetMixin {
  dynamic movieUiData;
  MovieGridView({Key? key, required this.movieUiData}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        _buildMovieImage(
            AppValues.movieTileWeight,
            AppValues.movieTileHeight,
            titleOnBottom: movieUiData.originalTitle
        )
      ],
    );
  }

  Widget _buildMovieImage(double width, double height, {String? titleOnBottom}) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppValues.iconSize_14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.iconSize_14),
              child: Image.network(
                _getUrlFromData(movieUiData.posterPath),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          if (titleOnBottom != null) ...[
            SizedBox(
              width: width,
              child: Text(
                titleOnBottom,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              width: width,
              child: Text(
                movieUiData.releaseDate,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: AppValues.radius_12, color: Colors.grey),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _onTap() {
    Get.toNamed(Routes.PROJECT_DETAILS);
  }

  String _getUrlFromData(posterPath) {
    return "https://image.tmdb.org/t/p/w500${posterPath}";
  }
}
