import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/providers/game_end_provider.dart';
import 'package:sudoku_mordern/src/ui/screens/game_end_screen.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_board.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_num_pad.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      gameEndNotifierProvider,
      (previous, next) {
        if (next) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GameEndScreen(),
            ),
          );
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sudoku",
              style: context.textTheme.headlineLarge,
            ),
            const Center(child: GameBoard()),
            SizedBox(height: 32.h),
            const Center(child: GameNumPad())
          ],
        ),
      ),
    );
  }
}
