import 'package:flutter/material.dart';
import 'package:movie_base/app/core/widget/ripple.dart';
import 'package:get/get.dart';
import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/elevated_container.dart';
import '/app/core/widget/icon_text_widgets.dart';
import '/app/modules/home/model/github_project_ui_data.dart';
import '/app/routes/app_pages.dart';

class MovieHeader extends StatelessWidget with BaseWidgetMixin {
  //final GithubProjectUiData dataModel;

  MovieHeader({
    Key? key,
    //required this.dataModel,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
        child: Expanded(
            child: Text('ts')
        ),
    );
  }


    //Get.toNamed(Routes.PROJECT_DETAILS, arguments: dataModel);

}
