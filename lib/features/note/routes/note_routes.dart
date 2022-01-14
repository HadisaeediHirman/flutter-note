import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../bindings/note_binding.dart';
import '../presentation/pages/add_update_note_screen.dart';
import '../presentation/pages/note_detail_screen.dart';
import '../presentation/pages/note_screen.dart';

List<GetPage> noteRoutes = [
  GetPage(
    name: AppRoutes.note,
    page: () => const NoteScreen(),
    binding: NoteBinding(),
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
