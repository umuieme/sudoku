import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'game_mode_visibility_provider.g.dart';

@riverpod
class GameDifficultyVisibilityNotifier
    extends _$GameDifficultyVisibilityNotifier {
  @override
  bool build() {
    return false;
  }

  void toogleVisibility() {
    state = !state;
  }
}
