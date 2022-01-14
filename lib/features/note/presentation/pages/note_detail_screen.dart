import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../data/models/note.dart';
import '../controllers/note_controller.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    final note = Get.arguments as Note;
    return Scaffold(
      appBar: NoteAppbar(
        actions: [
          ActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
          ActionButton(
            onPressed: () {
              // controller.delete(note.id!);
              // context.showMessage(
              //   "1 ${"delete_msg".tr}",
              // );
              // Navigator.pop(context);
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
                note.dateTime ?? "",
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
