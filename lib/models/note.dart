import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(3)
  final String? id;

  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final String? createdAt;

  @HiveField(4)
  final int? color;

  Note({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.color,
  });
}
