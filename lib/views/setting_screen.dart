import 'package:flutter/material.dart';
import 'package:simple_hive_note/models/setting.dart';
import 'package:simple_hive_note/theme/spacing.dart';
import 'package:simple_hive_note/widgets/note_appbar.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppbar(
        title: "settings".tr,
      ),
      body: Column(
        children: Setting.settings
            .map(
              (setting) => _SettingItem(
                setting: setting,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({Key? key, required this.setting}) : super(key: key);
  final Setting setting;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(AppSpacings.xl),
        child: Row(
          children: [
            Icon(setting.icon),
            const SizedBox(width: AppSpacings.m),
            Text(
              setting.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
