import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const AppSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: Transform.scale(
        transformHitTests: false,
        scale: 0.8,
        child: CupertinoSwitch(
          value: value,
          activeColor: context.primaryColor,
          trackColor: AppColors.text.withOpacity(0.24),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
