import 'dart:ui' show Color;
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/todo_entity.dart';
part 'note_entity.freezed.dart';

@freezed
class NoteEntity with _$NoteEntity {
  const NoteEntity._();

  factory NoteEntity({
    String? id,
    String? title,
    String? description,
    Color? color,
    DateTime? dateTime,
    @Default([]) List<TodoEntity> todos,
  }) = _NoteEntity;

  bool get hasTodo => todos.isNotEmpty;
}
