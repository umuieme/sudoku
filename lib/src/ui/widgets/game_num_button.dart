import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';

class GameNumButton extends StatelessWidget {
  final int value;
  final Function(int)? onPressed;
  const GameNumButton({super.key, required this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.r),
      child: TextButton(
        onPressed: () => onPressed?.call(value),
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
        ),
        child: Text(
          "$value",
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
