import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
part 'cell_selection_provider.g.dart';

@riverpod
class CellSelectionNotifier extends _$CellSelectionNotifier {
  @override
  CellValue build() {
    return CellValue.empty();
  }

  void selectCell(CellValue cell) {
    state = cell;
  }
}
