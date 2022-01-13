import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../presentation/pages/setting_screen.dart';

List<GetPage> settingRoutes = [
  GetPage(
    name: AppRoutes.setting,
    page: () => SettingScreen(),
  ),
];
