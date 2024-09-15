import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/enum.dart';

final scoreDataStoreProvider = Provider(
  (ref) async {
    final scoreBox = await Hive.openBox("score");
    return ScoreDataStore(box: scoreBox);
  },
);

class ScoreDataStore {
  final Box box;
  // final String _scoreKey = "score";

  ScoreDataStore({required this.box});

  Future<void> saveScore(Difficulty difficulty, int seconds) async {
    return box.put(difficulty.name, seconds);
  }

  int getScore(Difficulty difficulty) {
    return box.get(difficulty.name, defaultValue: 0);
  }
}
