import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app.dart';
import 'core/utils/constants.dart';
import 'features/note/data/models/note.dart';
import 'features/note/data/models/todo.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox(databaseBox);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const App());
}
