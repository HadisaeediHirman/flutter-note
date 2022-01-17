import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/utils/snackbar.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/change_language_usecase.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/change_theme_usecase.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/get_language_usecase.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/get_theme_usecase.dart';

class SettingController extends GetxController {
  final GetThemeUsecase _getThemeUsecase;
  final GetLanguageUsecase _getLanguageUsecase;
  final ChangeThemeUsecase _changeThemeUsecase;
  final ChangeLanguageUsecase _changeLanguageUsecase;

  SettingController(
    this._getThemeUsecase,
    this._getLanguageUsecase,
    this._changeThemeUsecase,
    this._changeLanguageUsecase,
  );

  RxBool isDark = true.obs;
  RxString language = "us".obs;

  @override
  onInit() {
    super.onInit();
    getTheme();
    getLanguage();
  }

  getTheme() {
    final failOrSuccess = _getThemeUsecase();

    failOrSuccess.fold(
      (error) => AppSnackbar.showSnackbar(error.message ?? ""),
      (theme) {
        isDark.value = theme;
      },
    );
  }

  getLanguage() {
    final failOrSuccess = _getLanguageUsecase();

    failOrSuccess.fold(
      (error) => AppSnackbar.showSnackbar(error.message ?? ""),
      (lang) {
        language.value = lang;
      },
    );
  }

  void toggleTheme() {
    isDark.value = !isDark.value;
    print("dark = ${isDark.value}");
    changeTheme();
  }

  changeTheme() {
    final failOrSuccess = _changeThemeUsecase(isDark.value);

    failOrSuccess.fold(
      (error) => AppSnackbar.showSnackbar(error.message ?? ""),
      (_) {
        print("injas");
        Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
