import 'package:get/get.dart';

import '../../../core/data/database.dart';
import '../data/repositories/note_repository.dart';
import '../domain/usecases/get_all_note_usecase.dart';
import '../presentation/controllers/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DatabaseProvider());
    Get.lazyPut(() => NoteRepositoryImpl(Get.find<DatabaseProvider>()));
    Get.lazyPut(() => GetAllNotesUsecase(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => NoteController(Get.find<GetAllNotesUsecase>()));
  }
}
