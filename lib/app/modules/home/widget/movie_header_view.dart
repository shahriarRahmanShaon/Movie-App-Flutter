import 'package:flutter/material.dart';
import 'package:movie_base/app/core/values/app_values.dart';
import '/app/core/base/base_widget_mixin.dart';

class MovieHeader extends StatelessWidget with BaseWidgetMixin {
  MovieHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _buildMovieImage(width, height),
            _buildRatingBox(),
            _buildMovieDetailsOverlay(width, height),
          ],
        ),
      ],
    );
  }

  Widget _buildMovieImage(double width, double height) {
    return Container(
      width: width,
      height: height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yts.mx/assets/images/movies/good_one_2024/large-cover.jpg',
          fit: BoxFit.fill,
        
        ),
      ),
    );
  }

  Widget _buildRatingBox() {
    return Positioned(
      top: AppValues.padding,
      left: AppValues.padding,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: AppValues.padding,
            ),
            SizedBox(width: 4),
            Text(
              '8.5',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieDetailsOverlay(double width, double height) {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)
        ),
        width: width-32,
        height: height / 10,
        padding: const EdgeInsets.all(AppValues.padding),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fast Forward (1985)',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppValues.padding,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Action, Drama | 1h 34m',
              style: TextStyle(
                color: Colors.white70,
                fontSize: AppValues.padding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
