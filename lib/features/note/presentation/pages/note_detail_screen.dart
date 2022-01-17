import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/routes/app_routes.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../controllers/note_controller.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    final note = Get.arguments as NoteEntity;
    return Scaffold(
      appBar: NoteAppbar(
        actions: [
          ActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addUpdate, arguments: note);
            },
            child: const Icon(Icons.edit),
          ),
          ActionButton(
            onPressed: () {
              controller.delete(note.id!);
              Get.back();
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
                note.dateWithTime,
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
