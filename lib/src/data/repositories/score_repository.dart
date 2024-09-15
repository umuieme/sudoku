import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/enum.dart';
import 'package:sudoku_mordern/src/data/data_store/score_data_store.dart';

final scoreRepositoryProvider = Provider(ScoreRepository.new);

class ScoreRepository {
  final Ref ref;

  ScoreRepository(this.ref);
  Future<void> saveGameScore(Difficulty difficulty, int seconds) async {
    final store = await ref.read(scoreDataStoreProvider);
    store.saveScore(difficulty, seconds);
  }

  Future<List<(Difficulty, int)>> getAllGameScoreList() async {
    final store = await ref.read(scoreDataStoreProvider);
    return Difficulty.values.map((e) => (e, store.getScore(e))).toList();
  }

  Future<int> getGameScore(Difficulty difficulty) async {
    final store = await ref.read(scoreDataStoreProvider);
    return store.getScore(difficulty);
  }
}
