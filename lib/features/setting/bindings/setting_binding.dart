import 'package:get/get.dart';

import '../presentation/controllers/setting_controller.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController(), permanent: true);
  }
}
