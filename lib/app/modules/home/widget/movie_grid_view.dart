import 'package:movie_base/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/app/modules/home/model/home_ui_data.dart';

class MovieGridView extends StatelessWidget with BaseWidgetMixin {
  TopMovieUiData movieUiData;
  MovieGridView({Key? key, required this.movieUiData}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        _buildMovieImage(130, 200, titleOnBottom: movieUiData.originalTitle)
      ],
    );
  }

  Widget _buildMovieImage(double width, double height, {String? titleOnBottom}) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
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
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ],
    );
  }

  String _getUrlFromData(posterPath) {
    return "https://image.tmdb.org/t/p/w500${posterPath}";
  }
}
