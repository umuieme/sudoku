import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/providers/game_play_provider.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_num_button.dart';

class GameNumPad extends ConsumerWidget {
  const GameNumPad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<int>> num = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];

    return Column(
      children: [
        Column(
          children: num.map((row) => Row(
                children: row
                    .map((value) => GameNumButton(
                          value: value,
                          onPressed: (value) => ref
                              .read(gamePlayNotifierProvider.notifier)
                              .updateCellValue(value),
                        ))
                    .toList(),
              )).toList(),
        )
      ],
    );
  }
}
