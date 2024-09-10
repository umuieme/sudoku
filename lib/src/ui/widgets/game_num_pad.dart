import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/providers/game_play_provider.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_num_button.dart';

class GameNumPad extends ConsumerWidget {
  final _numbers = const [1, 2, 3, 4, 5, 6, 7, 8, 9];
  const GameNumPad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 192.h,
      width: 192.h,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 16.r,
        crossAxisSpacing: 16.r,
        children: _numbers
            .map(
              (e) => GameNumButton(
                value: e,
                onPressed: () => ref
                    .read(gamePlayNotifierProvider.notifier)
                    .updateCellValue(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
