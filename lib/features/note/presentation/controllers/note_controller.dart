import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/domain/usecases/delete_multiple_notes_usecase.dart';
import 'package:simple_hive_note/features/note/domain/usecases/delete_note_usecase.dart';

import '../../../../core/utils/snackbar.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/usecases/add_update_note_usecase.dart';
import '../../domain/usecases/get_all_note_usecase.dart';

class NoteController extends GetxController {
  final GetAllNotesUsecase _getAllNotesUsecase;
  final AddUpdateNoteUsecase _addUpdateNoteUsecase;
  final DeleteNoteUsecase _deleteNoteUsecase;
  final DeleteMultipleNoteUsecase _deleteMultipleNoteUsecase;
  NoteController(
    this._getAllNotesUsecase,
    this._addUpdateNoteUsecase,
    this._deleteNoteUsecase,
    this._deleteMultipleNoteUsecase,
  );

  List<NoteEntity> notes = <NoteEntity>[];
  // RxString errorMessage = "".obs;

  List<String> selectedIds = <String>[];
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  RxBool isLoading = false.obs;
  Rx<Color> selectedColor = (colors.randomElement as Color).obs;

  @override
  void onInit() {
    super.onInit();

    fetchAllNotes();
  }

  void setSelectedColor(Color value) => selectedColor.value = value;

  fetchAllNotes() async {
    final failOrSuccess = await _getAllNotesUsecase();

    failOrSuccess.fold(
      (error) => {},
      (noteEntities) {
        notes.clear();
        notes.addAll(noteEntities);
      },
    );
    update(['note_list']);
  }

  addUpdateNote(NoteEntity note) async {
    final bool _isEdit = note.id != null;
    final failOrSuccess = await _addUpdateNoteUsecase(note);

    isLoading.value = true;

    await Future.delayed(animationDuration);

    failOrSuccess.fold(
      (error) {
        AppSnackbar.showSnackbar(error.message ?? "", isError: true);
        print(error.message);
      },
      (_) {
        if (_isEdit) {
          AppSnackbar.showSnackbar("note_updated".tr);
        } else {
          AppSnackbar.showSnackbar("note_added".tr);
        }
      },
    );

    isLoading.value = false;
  }

  bool isSelected(String? id) => (id != null) && (selectedIds.contains(id));

  toggleSelect(String noteId) {
    if (selectedIds.contains(noteId)) {
      selectedIds.remove(noteId);
    } else {
      selectedIds.add(noteId);
    }
    update(['note_list', 'note_actions']);
  }

  void cancelDeleting() {
    selectedIds.clear();
    update(['note_list', 'note_actions']);
  }

  deleteMultiNotes() async {
    final failOrSuccess = await _deleteMultipleNoteUsecase(selectedIds);

    failOrSuccess.fold(
      (error) => print(error.message),
      (_) {
        selectedIds.clear();
        update(['note_list', 'note_actions']);
      },
    );
  }

  delete(String noteId) async {
    final failOrSuccess = await _deleteNoteUsecase(noteId);

    failOrSuccess.fold(
      (error) => print(error.message),
      (_) {},
    );
  }
}
