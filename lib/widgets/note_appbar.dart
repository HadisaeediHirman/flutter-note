import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/theme/spacing.dart';
import 'package:simple_hive_note/widgets/action_button.dart';

import '../constants.dart';

class NoteAppbar extends StatelessWidget with PreferredSizeWidget {
  const NoteAppbar({
    Key? key,
    this.title,
    this.actions,
    this.autoImplementLeading = true,
  }) : super(key: key);

  final bool autoImplementLeading;
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
              if (autoImplementLeading) ...{
                ActionButton(
                  child: Icon(
                    Get.locale == fa
                        ? Icons.keyboard_arrow_right_rounded
                        : Icons.keyboard_arrow_left_rounded,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: AppSpacings.l),
              },
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
              },
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
