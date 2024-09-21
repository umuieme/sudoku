import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/enum.dart';
import 'package:sudoku_mordern/src/providers/game_difficulty_provider.dart';
import 'package:sudoku_mordern/src/providers/game_mode_visibility/game_mode_visibility_provider.dart';
import 'package:sudoku_mordern/src/ui/common/secondary_button.dart';
import 'package:sudoku_mordern/src/ui/game_play/game_screen.dart';

class GameModeContainer extends HookConsumerWidget {
  const GameModeContainer({super.key});

  void onPressed(BuildContext context, WidgetRef ref, Difficulty difficulty) {
    ref
        .read(gameDifficultyNotifierProvider.notifier)
        .changeDifficulty(difficulty);
    ref
        .read(gameDifficultyVisibilityNotifierProvider.notifier)
        .toogleVisibility();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          AppSecondaryButton(
            title: "Easy",
            onPressed: () {
              onPressed(context, ref, Difficulty.easy);
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          AppSecondaryButton(
            title: "Medium",
            onPressed: () {
              onPressed(context, ref, Difficulty.medium);
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          AppSecondaryButton(
            title: "Hard",
            onPressed: () {
              onPressed(context, ref, Difficulty.hard);
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          AppSecondaryButton(
            title: "Super Hard",
            onPressed: () {
              onPressed(context, ref, Difficulty.superHard);
            },
          ),
        ],
      ),
    );
  }
}
