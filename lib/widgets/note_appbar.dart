import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:simple_hive_note/theme/spacing.dart';

class NoteAppbar extends StatelessWidget with PreferredSizeWidget {
  const NoteAppbar({Key? key, this.title, this.actions}) : super(key: key);

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacings.xl),
        padding: const EdgeInsets.symmetric(vertical: AppSpacings.xl),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title != null
                  ? Expanded(
                      child: Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const Spacer(),
              if (actions != null) ...{
                ...actions!
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: AppSpacings.l),
                        child: e,
                      ),
                    )
                    .toList(),
              }
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
