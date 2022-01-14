import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/data/models/note.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';
import '../../../../core/data/database.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/action_button.dart';
import '../../../../core/widgets/error_text.dart';
import '../../../../core/widgets/note_appbar.dart';
import '../../../setting/presentation/pages/setting_screen.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_card.dart';
import 'add_update_note_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteScreen extends GetView<NoteController> {
  const NoteScreen({Key? key}) : super(key: key);

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
                          // controller.deleteNotes();
                          // context.showMessage(
                          //     "${controller.selectedIds.length} ${"delete_msg".tr}");
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
                        onPressed: () {},
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
      body: ValueListenableBuilder(
        valueListenable: DatabaseProvider().box.listenable(),
        builder: (BuildContext context, _, Widget? child) {
          return GetBuilder<NoteController>(
            id: "get_all_notes",
            builder: (controller) {
              if (controller.error.value != "") {
                print("error = ${controller.error.string}");
                return ErrorText(message: controller.error.string);
              }
              return _BuildNotesList(notes: controller.notes);
            },
          );
        },
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

class _BuildNotesList extends StatelessWidget {
  const _BuildNotesList({Key? key, required this.notes}) : super(key: key);

  final List<NoteEntity> notes;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacings.xl,
      crossAxisSpacing: AppSpacings.xl,
      children: List.generate(
        notes.length,
        (index) {
          final note = notes[index];
          return FadeInDown(
            delay: Duration(milliseconds: 150 * index),
            child: NoteCard(
              note: note,
              // selected: controller.isSelected(note.id),
              // onSelect: () => controller.toggleSelect(note.id),
              // onTap: () {
              //   if (controller.selectedIds.isEmpty) {
              //     Get.toNamed(AppRoutes.noteDetail, arguments: note);
              //   } else {
              //     controller.toggleSelect(note.id);
              //   }
              // },
            ),
          );
        },
      ),
    );
  }
}
