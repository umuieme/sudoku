import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/enum.dart';
import 'package:sudoku_mordern/src/providers/game_difficulty_provider.dart';
import 'package:sudoku_mordern/src/ui/common/app_logo.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';
import 'package:sudoku_mordern/src/ui/common/secondary_button.dart';
import 'package:sudoku_mordern/src/ui/screens/game_screen.dart';
import 'package:sudoku_mordern/src/ui/widgets/home_game_score.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  void onPressed(BuildContext context, WidgetRef ref, Difficulty difficulty) {
    ref
        .read(gameDifficultyNotifierProvider.notifier)
        .changeDifficulty(difficulty);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDifficulty = useState(false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AppLogo(
                height: 200.h,
              ),
              if (!showDifficulty.value) const HomeGameRecord(),
              const Spacer(),
              AppPrimaryButton(
                title: "Start Game",
                onPressed: () {
                  showDifficulty.value = !showDifficulty.value;
                },
              ),
              if (showDifficulty.value)
                Column(
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
                    )
                  ],
                ),
              SizedBox(height: 32.h),
              AppPrimaryButton(
                title: "Challenge a friend",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(),
                      ));
                },
              ),
              SizedBox(
                height: 16.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
