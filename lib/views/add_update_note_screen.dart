import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:simple_hive_note/constants.dart';
import 'package:simple_hive_note/controllers/note_controller.dart';
import 'package:simple_hive_note/models/note.dart';
import 'package:simple_hive_note/widgets/action_button.dart';
import 'package:uuid/uuid.dart';

class AddUpdateNoteScreen extends StatefulWidget {
  const AddUpdateNoteScreen({Key? key, this.note}) : super(key: key);

  final Note? note;

  @override
  State<AddUpdateNoteScreen> createState() => _AddUpdateNoteScreenState();
}

class _AddUpdateNoteScreenState extends State<AddUpdateNoteScreen> {
  late final _titleController = TextEditingController();
  late final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  height: 100,
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                        child: Icon(
                          Get.locale == fa
                              ? Icons.keyboard_arrow_right_rounded
                              : Icons.keyboard_arrow_left_rounded,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ActionButton(
                        child: Text(
                          controller.isLoading.value ? "saving".tr : "save".tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          final now = Jalali.fromDateTime(DateTime.now());
                          final _uuid = const Uuid();
                          final note = Note(
                            id: _uuid.v4(),
                            title: _titleController.text,
                            description: _descriptionController.text,
                            createdAt: "${now.day}/${now.month}/${now.year}",
                            color: colors.randomElement.value,
                          );

                          await controller.addNote(note);
                          _titleController.clear();
                          _descriptionController.clear();
                          context.showMessage("یادداشت با موفقیت اضافه شد.");
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _BuildForm(
                    titleController: _titleController,
                    descriptionController: _descriptionController,
                  ),
                ),
              ],
            ),
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(.2),
              ),
          ],
        ),
      ),
    );
  }
}

class _BuildForm extends StatelessWidget {
  const _BuildForm({
    Key? key,
    required this.titleController,
    required this.descriptionController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          _BuildField(
            controller: titleController,
            hint: "title".tr,
            autoFocus: true,
          ),
          // const SizedBox(height: 10),
          _BuildField(
            controller: descriptionController,
            hint: "type_something".tr,
            maxLines: null,
            fonSize: 20,
          ),
        ],
      ),
    );
  }
}

class _BuildField extends StatelessWidget {
  const _BuildField({
    Key? key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.fonSize = 30,
    this.autoFocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final double? fonSize;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fonSize,
        fontWeight: maxLines != null ? FontWeight.bold : null,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: fonSize,
          fontWeight: maxLines != null ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
