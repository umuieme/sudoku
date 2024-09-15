import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/config/extensions/int_extension.dart';

part 'game_timer_provider.g.dart';

@riverpod
class GameTimerNotifier extends _$GameTimerNotifier {
  Timer? _timer;
  @override
  (int, String) build() {
    // ref.listen(
    //   gameStateNotifierProvider,
    //   (previous, next) {
    //     if (next == GameState.success || next == GameState.failure) {
    //       _timer?.cancel();
    //     }
    //   },
    // );
    int seconds = 0;
    dispose();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
      // timer.;
      state = (seconds, seconds.formatToMinuteAndSecond);
    });

    return (seconds, seconds.formatToMinuteAndSecond);
  }

  void dispose() {
    ref.onDispose(() {
      _timer?.cancel();
    });
  }
}
