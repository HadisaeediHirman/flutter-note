import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';
import 'core/utils/utils.dart';
import 'features/note/presentation/controllers/setting_controller.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final controller = Get.put(SettingController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Note',
      translations: Localization(),
      locale: controller.locale,
      fallbackLocale: const Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      transitionDuration: pageTransitionDuration,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: controller.themeMode,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
    );
  }
}
