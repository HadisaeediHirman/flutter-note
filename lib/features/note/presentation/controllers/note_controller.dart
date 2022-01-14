import 'package:get/get.dart';
import 'package:simple_hive_note/features/note/domain/entities/note_entity.dart';

import '../../domain/usecases/get_all_note_usecase.dart';

class NoteController extends GetxController {
  final GetAllNotesUsecase _getAllNotesUsecase;
  NoteController(this._getAllNotesUsecase);

  RxList<NoteEntity> notes = <NoteEntity>[].obs;
  RxString error = "".obs;
  var selectedIds = <String>[].obs;

  // var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchAllNotes();
  }

  fetchAllNotes() async {
    final failOrSuccess = await _getAllNotesUsecase();

    failOrSuccess.fold(
      (error) => print(error.message),
      (notes) {
        notes.addAll(notes);
        update(['get_all_notes']);
      },
    );
  }
}
