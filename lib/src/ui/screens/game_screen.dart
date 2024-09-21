import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/gen/assets.gen.dart';
import 'package:sudoku_mordern/src/providers/game_end_provider.dart';
import 'package:sudoku_mordern/src/providers/game_play_provider.dart';
import 'package:sudoku_mordern/src/ui/common/confirmation_dialog.dart';
import 'package:sudoku_mordern/src/ui/screens/game_end_screen.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_board.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_num_pad.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_timer.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  void _onExitPressed(BuildContext context) async {
    final result = await showConfirmationDialog(
        context: context,
        title: "Do you want to exit",
        desription: "All your progress will be lost",
        confirmActionTitle: "Exit");
    if (result && context.mounted) {
      Navigator.pop(context);
    }
  }

  void _onResetPressed(BuildContext context, WidgetRef ref) async {
    final result = await showConfirmationDialog(
      context: context,
      title: "Do you want to reset",
      desription:
          "All your changes will be lost. You have start from beginning",
      confirmActionTitle: "Yes",
    );
    if (result && context.mounted) {
      ref.read(gamePlayNotifierProvider.notifier).resetGame();
    }
  }

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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        _onExitPressed(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const GameTimer(),
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app_rounded,
            ),
            onPressed: () => _onExitPressed(context),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                Assets.svg.reset,
                height: 16.h,
                width: 16.h,
              ),
              onPressed: () => _onResetPressed(context, ref),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: GameBoard()),
            SizedBox(height: 24.h),
            const Center(child: GameNumPad())
          ],
        ),
      ),
    );
  }
}
