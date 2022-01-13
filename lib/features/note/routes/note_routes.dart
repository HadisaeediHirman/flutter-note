import 'package:get/get.dart';
import 'package:simple_hive_note/core/routes/app_routes.dart';
import 'package:simple_hive_note/features/note/presentation/pages/add_update_note_screen.dart';
import 'package:simple_hive_note/features/note/presentation/pages/note_detail_screen.dart';
import 'package:simple_hive_note/features/note/presentation/pages/note_screen.dart';

List<GetPage> noteRoutes = [
  GetPage(
    name: AppRoutes.note,
    page: () => NoteScreen(),
  ),
  GetPage(
    name: AppRoutes.addUpdate,
    page: () => const AddUpdateNoteScreen(),
  ),
  GetPage(
    name: AppRoutes.noteDetail,
    page: () => const NoteDetailScreen(),
  ),
];
