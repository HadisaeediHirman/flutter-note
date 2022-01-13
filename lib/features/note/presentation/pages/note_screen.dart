import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/action_button.dart';
import '../../../../core/widgets/error_text.dart';
import '../../../../core/widgets/note_appbar.dart';
import '../../../setting/presentation/pages/setting_screen.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_card.dart';
import 'add_update_note_screen.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({Key? key}) : super(key: key);

  final controller = Get.put(NoteController());

  _changeLanguage(Locale locale) {
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar(
        title: "notes".tr,
        autoImplementLeading: false,
        actions: [
          Obx(
            () => controller.selectedIds.isEmpty
                ? ActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                        ),
                      );
                      // _changeLanguage(us);
                    },
                    child: const Icon(Icons.settings),
                  )
                : Row(
                    children: [
                      ActionButton(
                        onPressed: () {
                          controller.deleteNotes();
                          context.showMessage(
                              "${controller.selectedIds.length} ${"delete_msg".tr}");
                        },
                        child: Row(
                          children: [
                            Text(
                              "${"delete".tr} - ${controller.selectedIds.length}",
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.delete),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacings.l),
                      ActionButton(
                        onPressed: controller.cancelDeleteNotes,
                        child: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      floatingActionButton: FadeInLeft(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddUpdateNoteScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: Obx(
        () => controller.notes.isEmpty
            ? ErrorText(message: "empty_note".tr)
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(
                    controller.notes.length,
                    (index) {
                      final note = controller.notes[index];
                      return FadeInDown(
                        delay: Duration(milliseconds: 150 * index),
                        child: NoteCard(
                          note: note,
                          selected: controller.isSelected(note.id),
                          onSelect: () => controller.toggleSelect(note.id),
                          onTap: () {
                            if (controller.selectedIds.isEmpty) {
                              Get.toNamed(AppRoutes.noteDetail,
                                  arguments: note);
                            } else {
                              controller.toggleSelect(note.id);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
// TODO: Add setting page => change theme, change language
// TODO: Add Detail Screen => Edit Note
// TODO: Add Cancel Delete Button ----- Done 
// TODO: Add Todo
// TODO: Add Remember me => Notification
// TODO: Add Choose Color => Color Pallete
// TODO: Add Error Handling With dartz
// TODO: This is for end of application - Change to Clean architect.