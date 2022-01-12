import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
