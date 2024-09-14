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
  easy(36, 40),
  medium(41, 49),
  hard(50, 54),
  superHard(55, 60);

  final int min;
  final int max;
  const Difficulty(this.min, this.max);

  // A method to get a random number of cells to remove within the range
  int getRandomCellsToRemove() {
    return min + (Random().nextInt(max - min + 1));
  }
}
