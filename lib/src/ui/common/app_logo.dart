import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sudoku_mordern/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const AppLogo({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.svg.appLogo,
      height: height ?? 117.h,
      width: width ?? 183.w,
    );
  }
}
