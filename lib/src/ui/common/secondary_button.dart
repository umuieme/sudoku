import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSecondaryButton extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final GestureTapCallback? onPressed;
  final bool isLoading;
  final double? borderRadius;
  final Color? textColor;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? textStyle;

  const AppSecondaryButton({
    super.key,
    required this.title,
    this.padding,
    required this.onPressed,
    this.isLoading = false,
    this.borderRadius,
    this.textColor,
    this.color,
    this.border,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
              side: const BorderSide(color: AppColors.primary)),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(textColor ?? AppColors.text),
        padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h)),
        textStyle: WidgetStatePropertyAll(
          textStyle ?? context.textTheme.headlineSmall,
        ),
      ),
      child: Text(
        title,
      ),
    );
  }
}
