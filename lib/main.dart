import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_hive_note/constants.dart';
import 'package:simple_hive_note/localization/localization.dart';
import 'package:simple_hive_note/models/note.dart';
import 'package:simple_hive_note/theme/colors.dart';
import 'package:simple_hive_note/theme/theme.dart';
import 'package:simple_hive_note/views/note_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(databaseBox);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simple Note',
      translations: Localization(),
      locale: const Locale("fa", "IR"),
      fallbackLocale: const Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: NoteScreen(),
    );
  }
}
