import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/providers/game_play_provider.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_num_button.dart';

class GameNumPad extends ConsumerWidget {
  const GameNumPad({super.key});

  void _onNumberPressed(WidgetRef ref, int number) {
    ref.read(gamePlayNotifierProvider.notifier).updateCellValue(number);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      // height: 192.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3]
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: GameNumButton(
                      value: e,
                      onPressed: () => _onNumberPressed(ref, e),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [4, 5, 6]
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: GameNumButton(
                      value: e,
                      onPressed: () => _onNumberPressed(ref, e),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16.h),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...[7, 8, 9].map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: GameNumButton(
                  value: e,
                  onPressed: () => _onNumberPressed(ref, e),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
