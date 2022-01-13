import '../../data/models/note.dart';

abstract class NoteRepository {
  List<Note> getAllNotes();
  Future<Note> getNote(String id);
  Future addUpdateNote(Note note);
  Future deleteNote(String id);
  Future deleteMultiNotes(List<String> ids);
}
