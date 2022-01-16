import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Note',
      translations: Localization(),
      locale: const Locale("fa", "IR"),
      fallbackLocale: const Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      transitionDuration: pageTransitionDuration,
      theme: AppTheme.theme,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
    );
  }
}
