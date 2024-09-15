import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/gen/fonts.gen.dart';
import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/ui/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: AppColors.primary,
            fontFamily: FontFamily.nerko),
        home: const HomeScreen(),
      ),
    );
  }
}
