import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_hive_note/features/note/data/models/note.dart';

import '../../../../core/utils/utils.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    this.selected = false,
    this.onSelect,
    this.onTap,
  }) : super(key: key);

  final Note note;
  final bool selected;
  final Function()? onSelect;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      color: Color(note.colorValue ?? 0xff5C4F45),
      child: InkWell(
        splashColor: Colors.black12,
        onLongPress: onSelect,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 300,
            minHeight: 100,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      note.title ?? '',
                      presetFontSizes: const [16, 14, 12, 10, 8],
                      textScaleFactor: 2,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      group: AutoSizeGroup(),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note.dateTime ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              if (selected)
                Align(
                  alignment: Alignment.topLeft,
                  heightFactor: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 20,
                          color: Color(note.colorValue!),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check,
                        color: Color(note.colorValue!),
                        size: 20,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
