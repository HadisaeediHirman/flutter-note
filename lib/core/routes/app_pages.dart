import 'package:get/get.dart';
import 'package:simple_hive_note/core/routes/app_routes.dart';
import 'package:simple_hive_note/features/note/routes/note_routes.dart';
import 'package:simple_hive_note/features/setting/routes/setting_routes.dart';

class AppPages {
  static String get initialRoute => AppRoutes.note;
  static List<GetPage> get pages => [
        ...noteRoutes,
        ...settingRoutes,
      ];
}
