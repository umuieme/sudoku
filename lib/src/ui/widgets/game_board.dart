import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/providers/game_play_provider.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_row.dart';

class GameBoard extends HookConsumerWidget {
  const GameBoard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(gamePlayNotifierProvider);

    return Container(
      width: 314.w,
      // margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: context.primaryColor, width: 4.w),
      ),
      child: Column(
        children: data
            .map(
              (e) => GameRow(row: e),
            )
            .toList(),
      ),
    );
  }
}
