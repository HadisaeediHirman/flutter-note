import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/core/exceptions/error.dart';
import 'package:simple_hive_note/features/note/data/models/note.dart';
import 'package:uuid/uuid.dart';

import '../entities/note_entity.dart';
import '../repositories/note_repository.dart';
import '../../../../core/utils/utils.dart';

class AddUpdateNoteUsecase {
  final NoteRepository _repository;
  final _uuid = const Uuid();

  const AddUpdateNoteUsecase(this._repository);

  Future<Either<NoteError, Unit>> call(NoteEntity noteEntity) async {
    try {
      noteEntity.todos.removeWhere((todo) => todo.title.isEmptyString);
      final note = Note.fromNote(noteEntity);

      if (!note.validNote) {
        return left(NoteError(message: "title_empty".tr));
      }

      await _repository.addUpdateNote(note.copyWith(id: _uuid.v4()));
      return right(unit);
    } catch (e) {
      return left(
        NoteError(message: "failed_add_notes".tr),
      );
    }
  }
}
