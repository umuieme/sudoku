// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:flutter/material.dart';

class MainBackgroundImage extends StatelessWidget {
  final Widget child;
  const MainBackgroundImage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.bgGradient1,
            AppColors.bgGradient2,
            AppColors.bgGradient3,
          ],
        ),
      ),
      child: child,
    );
  }
}
