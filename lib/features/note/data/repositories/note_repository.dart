import '../../../../core/data/database.dart';
import '../../domain/repositories/note_repository.dart';
import '../models/note.dart';

class NoteRepositoryImpl implements NoteRepository {
  final DatabaseProvider _database;

  NoteRepositoryImpl(this._database);

  @override
  Future addUpdateNote(Note note) async {
    try {
      await _database.addUpdate(note.id!, note);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteMultiNotes(List<String> ids) async {
    try {
      await _database.deleteAll(ids);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteNote(String id) async {
    try {
      await _database.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Note> getAllNotes() {
    try {
      final notes = _database.getAll().map((note) => note as Note).toList();
      return notes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Note> getNote(String id) async {
    try {
      final note = await _database.get(id) as Note;
      return note;
    } catch (e) {
      rethrow;
    }
  }
}
