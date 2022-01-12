import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting {
  final String title;
  final IconData icon;

  Setting({
    required this.title,
    required this.icon,
  });

  static final settings = [
    Setting(title: "change_language".tr, icon: Icons.language),
    Setting(title: "change_theme".tr, icon: Icons.dark_mode),
  ];
}
