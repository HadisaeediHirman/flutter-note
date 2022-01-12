import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/controllers/note_controller.dart';
import 'package:simple_hive_note/models/note.dart';
import 'package:simple_hive_note/theme/spacing.dart';
import 'package:simple_hive_note/theme/style.dart';
import 'package:simple_hive_note/widgets/action_button.dart';
import 'package:simple_hive_note/widgets/note_appbar.dart';
import '../constants.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    return Scaffold(
      appBar: NoteAppbar(
        actions: [
          ActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
          ActionButton(
            onPressed: () {
              controller.delete(note.id!);
              context.showMessage(
                "پا ک شد",
              );
              Navigator.pop(context);
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacings.l, vertical: AppSpacings.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectableText(
                note.title ?? "",
                style: AppTextStyle.title,
              ),
              const SizedBox(height: AppSpacings.l),
              SelectableText(
                note.createdAt ?? "",
                style: AppTextStyle.date,
              ),
              const SizedBox(height: AppSpacings.xxl),
              SelectableText(
                note.description ?? "",
                style: AppTextStyle.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
