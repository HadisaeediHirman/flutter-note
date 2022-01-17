import 'package:get/get.dart';
import 'package:simple_hive_note/features/setting/data/repositories/setting_repository.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/change_language_usecase.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/change_theme_usecase.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/get_language_usecase.dart';
import 'package:simple_hive_note/features/setting/domain/usecases/get_theme_usecase.dart';
import 'package:simple_hive_note/features/setting/presentation/controllers/setting_controller.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingRepositoryImpl());
    Get.lazyPut(() => GetThemeUsecase(Get.find<SettingRepositoryImpl>()));
    Get.lazyPut(() => GetLanguageUsecase(Get.find<SettingRepositoryImpl>()));
    Get.lazyPut(() => ChangeThemeUsecase(Get.find<SettingRepositoryImpl>()));
    Get.lazyPut(() => ChangeLanguageUsecase(Get.find<SettingRepositoryImpl>()));
    Get.lazyPut(() =>
        SettingController(Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
