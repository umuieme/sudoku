import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/providers/game_timer_provider.dart';

class GameTimer extends ConsumerWidget {
  const GameTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(gameTimerNotifierProvider);
    return Text(
      time,
      style: context.textTheme.headlineSmall,
    );
  }
}
