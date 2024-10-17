import 'package:movie_base/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

class MovieGridView extends StatelessWidget with BaseWidgetMixin {

  MovieGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        _buildMovieImage(130, 200, titleOnBottom: 'SpiderMan Returns And Dies')
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
              'https://yts.mx/assets/images/movies/good_one_2024/large-cover.jpg',
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
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            width: width,
            child: Text(
              '2022-2023, 2Hr',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ],
    );
  }

}
