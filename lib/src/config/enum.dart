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
