import 'package:get/get.dart';
import 'package:simple_hive_note/features/setting/bindings/setting_binding.dart';

import '../../../core/routes/app_routes.dart';
import '../presentation/pages/setting_screen.dart';

List<GetPage> settingRoutes = [
  GetPage(
    name: AppRoutes.setting,
    page: () => SettingScreen(),
    binding: SettingBindings(),
  ),
];
