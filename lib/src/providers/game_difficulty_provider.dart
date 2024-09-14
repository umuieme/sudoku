import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/config/enum.dart';

part 'game_difficulty_provider.g.dart';

@Riverpod(keepAlive: true)
class GameDifficultyNotifier extends _$GameDifficultyNotifier {
  @override
  Difficulty build() {
    return Difficulty.hard;
  }

  void changeDifficulty(Difficulty difficulty) {
    state = difficulty;
  }
}
