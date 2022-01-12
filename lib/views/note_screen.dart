import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/controllers/note_controller.dart';
import 'package:simple_hive_note/theme/colors.dart';
import 'package:simple_hive_note/views/add_update_note_screen.dart';
import 'package:simple_hive_note/widgets/action_button.dart';
import 'package:simple_hive_note/widgets/empty_text.dart';
import 'package:simple_hive_note/widgets/note_appbar.dart';
import 'package:simple_hive_note/widgets/note_card.dart';
import '../constants.dart';

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
        actions: [
          Obx(
            () => controller.selectedIds.isEmpty
                ? ActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.settings),
                  )
                : ActionButton(
                    onPressed: () {
                      controller.deleteNotes();
                      context.showMessage(
                          "${controller.selectedIds.length} یادداشت با موفقیت حذف شدند.");
                    },
                    child: Row(
                      children: [
                        Text(
                          "حذف - ${controller.selectedIds.length}",
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.delete),
                      ],
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FadeInLeft(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "1",
              onPressed: () => _changeLanguage(fa),
              child: const Text("FA"),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => _changeLanguage(us),
              child: const Text("US"),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: "2",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddUpdateNoteScreen(),
                  ),
                );
              },
              backgroundColor: AppColors.success,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.notes.isEmpty
            ? EmptyText(message: "empty_note".tr)
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
                              print("Navigate");
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
// TODO: Add Cancel Delete Button
// TODO: Add Todo
// TODO: Add Remember me => Notification
// TODO: Add Choose Color => Color Pallete
// TODO: Add Error Handling With dartz