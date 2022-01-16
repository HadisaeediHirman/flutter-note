import 'package:flutter/material.dart';

class BuildField extends StatelessWidget {
  const BuildField({
    Key? key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.fonSize = 30,
    this.autoFocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final double? fonSize;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fonSize,
        fontWeight: maxLines != null ? FontWeight.bold : null,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: fonSize,
          fontWeight: maxLines != null ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
