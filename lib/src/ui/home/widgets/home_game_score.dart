import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/config/extensions/int_extension.dart';
import 'package:sudoku_mordern/src/providers/game_score/game_score_provider.dart';
import 'package:sudoku_mordern/src/ui/common/app_loading.dart';
import 'package:sudoku_mordern/src/ui/common/error_view.dart';

class HomeGameRecord extends ConsumerWidget {
  const HomeGameRecord({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref.watch(gameScoreNotifierProvider);
    return Center(
      child: Column(
        children: [
          Text(
            "Record",
            style: context.textTheme.displayMedium,
          ),
          record.when(
              data: (data) {
                return Column(
                  children: data
                      .map(
                        (e) => Text(
                          "${e.$1}: ${e.$2.formatToMinuteAndSecond}",
                          style: context.textTheme.headlineMedium,
                        ),
                      )
                      .toList(),
                );
              },
              error: (error, stackTrace) => const ErrorView(
                    message: "Opps",
                  ),
              loading: () => const AppLoading())
        ],
      ),
    );
  }
}
