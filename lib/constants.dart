import 'dart:math';
import 'dart:ui' show Color;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_hive_note/theme/colors.dart';

const List<Color> colors = [
  Color(0xffFE9A37),
  Color(0xffCBDB57),
  Color(0xff9585BA),
  Color(0xff5C4F45),
  Color(0xffF96A4B),
  Color(0xffDEA44D),
  Color(0xff9E5C32),
];

const String databaseBox = "note_box";
const fa = Locale("fa", "IR");
const us = Locale("en", "US");
const animationDuration = Duration(milliseconds: 400);

final _random = Random();

extension RandomX on List {
  int get _index => _random.nextInt(length);

  dynamic get randomElement => this[_index];
}

extension ContextEx on BuildContext {
  void showMessage(String message, {bool isError = false}) {
    final snackBar = GetSnackBar(
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? AppColors.error : AppColors.primary,
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    Get.showSnackbar(snackBar);
  }
}
