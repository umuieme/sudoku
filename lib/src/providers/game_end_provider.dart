import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'game_end_provider.g.dart';

@riverpod
class GameEndNotifier extends _$GameEndNotifier {
  @override
  bool build() {
    return false;
  }

  updateGameOver() {
    state = true;
  }
}
