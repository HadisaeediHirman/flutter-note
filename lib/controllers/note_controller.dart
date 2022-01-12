import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:simple_hive_note/constants.dart';
import 'package:simple_hive_note/models/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  var selectedIds = <String>[].obs;
  var isLoading = false.obs;

  final _box = Hive.box<Note>(databaseBox);

  @override
  void onInit() {
    super.onInit();
    // _box.clear();
    notes.value = _box.values.toList();
    print(DateTime.now().toLocal());
  }

  addNote(Note note) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 400));
    notes.insert(0, note);
    await _box.put(note.id, note);
    isLoading.value = false;
  }

  bool isSelected(String? id) => (id != null) && selectedIds.contains(id);

  toggleSelect(String? id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      if (id != null) {
        selectedIds.add(id);
      }
    }
  }

  delete(String id) async {
    try {
      await _box.delete(id);
      notes.removeWhere((element) => element.id == id);
    } catch (e) {
      rethrow;
    }
  }

  deleteNotes() async {
    try {
      await _box.deleteAll(selectedIds.value);
      selectedIds.forEach((id) {
        notes.removeWhere((note) => note.id == id);
      });
      selectedIds.clear();
    } catch (e) {
      rethrow;
    }
  }
}
