import '/app/modules/main/model/menu_code.dart';
import 'package:flutter/material.dart';

class BottomNavItem {
  final String navTitle;
  final String? iconSvgName;
  final IconData iconName;
  final MenuCode menuCode;

  const BottomNavItem(
      {required this.navTitle,
       this.iconSvgName, required this.iconName, required this.menuCode});
}
