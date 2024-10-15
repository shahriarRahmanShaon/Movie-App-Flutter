import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_base/app/modules/main/model/menu_item.dart';

enum MenuCode { HOME, SEARCH, FAVORITE, SETTINGS }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          //iconSvgName: "ic_home.svg",
          iconName: Icons.home ,
          menuCode: MenuCode.HOME,
        );
      case MenuCode.FAVORITE:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavFavorite,
            //iconSvgName: "ic_favorite.svg",
            iconName: Icons.favorite,
            menuCode: MenuCode.FAVORITE);
      case MenuCode.SETTINGS:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavSettings,
            //iconSvgName: "ic_settings.svg",
            iconName: Icons.settings,
            menuCode: MenuCode.SETTINGS);
      case MenuCode.SEARCH:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavSearch,
            //iconSvgName: "ic_setings.svg",
            iconName: Icons.search,
            menuCode: MenuCode.SEARCH);
    }
  }
}
