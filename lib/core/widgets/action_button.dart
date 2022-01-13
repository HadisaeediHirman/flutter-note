import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 40,
          constraints: const BoxConstraints(minWidth: 40),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade600,
          ),
          child: child,
        ),
      ),
    );
  }
}
