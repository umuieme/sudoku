import 'dart:math';

enum MessageType {
  normal,
  success,
  error,
  warning,
}

enum MovieLanguageType {
  nepali("Nepali"),
  english("English"),
  hindi("Hindi");

  final String value;

  const MovieLanguageType(this.value);
}

enum GameState { start, success, failure, playing, finished }

enum Difficulty {
  easy(36, 40, "Easy"),
  medium(41, 49, "Medium"),
  hard(50, 54, "Hard"),
  superHard(55, 60, "Super hard");

  final int min;
  final int max;
  final String title;
  const Difficulty(this.min, this.max, this.title);

  // A method to get a random number of cells to remove within the range
  int getRandomCellsToRemove() {
    return min + (Random().nextInt(max - min + 1));
  }

  @override
  String toString() => title;
}
