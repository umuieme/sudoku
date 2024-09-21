import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/providers/game_mode_visibility/game_mode_visibility_provider.dart';
import 'package:sudoku_mordern/src/ui/common/app_logo.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';
import 'package:sudoku_mordern/src/ui/home/widgets/game_mode_container.dart';
import 'package:sudoku_mordern/src/ui/home/widgets/home_game_score.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDifficulty = ref.watch(gameDifficultyVisibilityNotifierProvider);

    final gameModeSizeAnimationcontroller =
        useAnimationController(duration: Durations.long2, initialValue: 0);

    final recordAnimationController =
        useAnimationController(duration: Durations.long2, initialValue: 1);

    useEffect(() {
      if (showDifficulty) {
        gameModeSizeAnimationcontroller.forward();
        Future.delayed(
          Durations.short2,
          () => recordAnimationController.reverse(),
        );
      } else {
        gameModeSizeAnimationcontroller.reverse();
        Future.delayed(
          Durations.short2,
          () => recordAnimationController.forward(),
        );
      }
      return null;
    }, [showDifficulty]);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AppLogo(
                height: 200.h,
              ),
              SizeTransition(
                axisAlignment: 1,
                sizeFactor: recordAnimationController,
                child: const HomeGameRecord(),
              ),
              const Spacer(),
              AppPrimaryButton(
                title: "Start Game",
                onPressed: () {
                  ref
                      .read(gameDifficultyVisibilityNotifierProvider.notifier)
                      .toogleVisibility();
                },
              ),
              SizeTransition(
                  sizeFactor: gameModeSizeAnimationcontroller,
                  axisAlignment: 1,
                  child: const GameModeContainer()),
              const Spacer(),
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
