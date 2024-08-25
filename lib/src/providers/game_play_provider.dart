import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/providers/cell_selection_provider.dart';

part 'game_play_provider.g.dart';

@riverpod
class GamePlayNotifier extends _$GamePlayNotifier {
  @override
  List<List<CellValue>> build() {
    final list = <List<CellValue>>[];
    for (var i = 0; i < 9; i++) {
      list.add(<CellValue>[]);
      for (var j = 0; j < 9; j++) {
        list[i].add(CellValue(x: i, y: j, value: i * 9 + j));
      }
    }
    return list;
  }

  void updateCellValue(int value) {
    final selectedCell = ref.read(cellSelectionNotifierProvider);
    final cell = selectedCell.copyWith(value: value);
    final list = state;
    list[cell.x][cell.y] = cell;
    state = [...list];
  }
}
