import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';

class GameNumButton extends StatelessWidget {
  final int value;
  final GestureTapCallback onPressed;
  const GameNumButton(
      {super.key, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 48.h,
      child: AppPrimaryButton(
        title: "$value",
        padding: EdgeInsets.all(0.r),
        onPressed: () => onPressed(),
      ),
    );
  }
}
