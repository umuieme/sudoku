import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final GestureTapCallback? onPressed;
  const ErrorView({
    super.key,
    required this.message,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
