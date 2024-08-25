import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/providers/game_play_provider.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_num_pad.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_row.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(gamePlayNotifierProvider);
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Sudoku",
              style: context.textTheme.headlineLarge,
            ),
            ...data.map(
              (e) => GameRow(row: e),
            ),
            const Expanded(child: GameNumPad())
          ],
        ),
      ),
    );
  }
}
