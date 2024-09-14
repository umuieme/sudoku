import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/providers/game_end_provider.dart';
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
        desription: "All your progress will be lost");
    if (result && context.mounted) {
      Navigator.pop(context);
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
          leading: const SizedBox(),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.exit_to_app_rounded,
              ),
              onPressed: () => _onExitPressed(context),
            )
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
