import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/local_storage_provider.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/strings.dart';

class SettingController extends GetxController {
  late bool isDarkMode;
  late String currentLocale;

  ThemeMode get themeMode =>
      _getIsDarkMode() ? ThemeMode.dark : ThemeMode.light;

  Locale get locale => _getLocale() == "fa" ? fa : us;

  @override
  void onInit() {
    isDarkMode = _getIsDarkMode();
    currentLocale = _getLocale();
    super.onInit();
  }

  void toggleTheme() {
    _changeTheme(!isDarkMode);
    final mode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(mode);
  }

  void toggleLocale() {
    _changeLocale(currentLocale == "fa" ? "us" : "fa");
    final locale = currentLocale == "fa" ? fa : us;
    Get.updateLocale(locale);
  }

  void _changeTheme(bool value) async {
    isDarkMode = value;
    await LocalStorageProvider().write(AppStrings.isDark, value);
    print("isDarkMode = $isDarkMode");
  }

  void _changeLocale(String value) async {
    currentLocale = value;
    await LocalStorageProvider().write(AppStrings.locale, value);
    print("locale = $currentLocale");
  }

  bool _getIsDarkMode() {
    try {
      return LocalStorageProvider().read(AppStrings.isDark);
    } catch (e) {
      return Get.isDarkMode;
    }
  }

  String _getLocale() {
    try {
      return LocalStorageProvider().read(AppStrings.locale);
    } catch (e) {
      return "fa";
    }
  }
}
