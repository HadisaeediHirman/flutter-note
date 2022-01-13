import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    // scaffoldBackgroundColor: AppColors.scaffoldBackground,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );

  // static ThemeData dark = ThemeData.dark().copyWith();
}
