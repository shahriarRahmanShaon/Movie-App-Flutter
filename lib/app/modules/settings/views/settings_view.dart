import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_base/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:movie_base/app/modules/main/controllers/main_controller.dart';
import 'package:movie_base/app/modules/main/model/menu_code.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ItemSettings(
          title: appLocalization.settingsTheme,
          prefixImage: 'ic_theme.png',
          suffixImage: 'arrow_forward.svg',
          onTap: _onThemeItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization.settingsLanguage,
          prefixImage: 'ic_language.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onLanguageItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: appLocalization.settingsFontSize,
          prefixImage: 'ic_font_size.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onFontSizeItemClicked,
        ),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked() {
    showToast('Theme: Development in progress');
  }

  void _onLanguageItemClicked() {
    _showLanguageSelectionDialog();
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }

  void _showLanguageSelectionDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("English"),
                onTap: () {
                  _changeLanguage('en');
                },
              ),
              ListTile(
                title: const Text("বাংলা"),
                onTap: () {
                  _changeLanguage('bn');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeLanguage(String languageCode) {
    Get.updateLocale(Locale(languageCode));
    Get.find<MainController>().onMenuSelected(MenuCode.HOME);
    Get.back();
    showToast("Language changed to ${languageCode == 'en' ? 'English' : 'বাংলা'}");
  }
}
