import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/config/enum.dart';
import 'package:sudoku_mordern/src/data/repositories/score_repository.dart';
part 'game_score_provider.g.dart';

@riverpod
class GameScoreNotifier extends _$GameScoreNotifier {
  @override
  Future<List<(Difficulty, int)>> build() async {
    try {
      final repo = ref.read(scoreRepositoryProvider);
      return repo.getAllGameScoreList();
    } on Exception catch (e) {
      log(e.toString(), error: e);
      rethrow;
    }
  }

  Future<void> updateScore(Difficulty difficulty, int time) async {
    final repo = ref.read(scoreRepositoryProvider);
    int previousTime = await repo.getGameScore(difficulty);
    if (previousTime == 0 || time < previousTime) {
      await repo.saveGameScore(difficulty, time);
    }
    ref.invalidateSelf();
  }
}
