import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/config/sudoku_generator.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/providers/cell_selection_provider.dart';

part 'game_play_provider.g.dart';

@riverpod
class GamePlayNotifier extends _$GamePlayNotifier {
  SudokuGenerator generator = SudokuGenerator();

  List<List<CellValue>> completeSudoko = [];
  @override
  List<List<CellValue>> build() {
    List<List<int>> sudokuValue = generator.generateSudoku();
    completeSudoko = [];
    for (var i = 0; i < sudokuValue.length; i++) {
      completeSudoko.add([]);
      for (var j = 0; j < sudokuValue[i].length; j++) {
        completeSudoko[i].add(CellValue(x: i, y: j, value: sudokuValue[i][j]));
      }
    }
    final unsolvedSudoku = generator.removeCells(20);
    final List<List<CellValue>> unsolved = [];
    for (var i = 0; i < unsolvedSudoku.length; i++) {
      unsolved.add([]);
      for (var j = 0; j < unsolvedSudoku[i].length; j++) {
        unsolved[i].add(CellValue(x: i, y: j, value: sudokuValue[i][j]));
      }
    }
    return unsolved;
  }

  void updateCellValue(int value) {
    final selectedCell = ref.read(cellSelectionNotifierProvider);

    final cell = selectedCell.copyWith(value: value);
    final list = state;
    list[cell.x][cell.y] = cell;
    state = [...list];
    final isCompleted = checkGameOver();
  }

  bool checkGameOver() {
    for (var i = 0; i < completeSudoko.length; i++) {
      for (var j = 0; j < completeSudoko[i].length; j++) {
        if (completeSudoko[i][j] != state[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  bool _isSafeToPlace(List<List<CellValue>> grid, int row, int col, int num) {
    return !_isUsedInRow(grid, row, num) &&
        !_isUsedInCol(grid, col, num) &&
        !_isUsedInBox(grid, row - row % 3, col - col % 3, num);
  }

  bool _isUsedInRow(List<List<CellValue>> grid, int row, int num) {
    return grid[row]
            .firstWhere(
              (element) => element.value == num,
              orElse: () => CellValue.empty(),
            )
            .value !=
        -1;
  }

  bool _isUsedInCol(List<List<CellValue>> grid, int col, int num) {
    for (int i = 0; i < grid.length; i++) {
      if (grid[i][col].value == num) return true;
    }
    return false;
  }

  bool _isUsedInBox(
      List<List<CellValue>> grid, int boxStartRow, int boxStartCol, int num) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[boxStartRow + i][boxStartCol + j].value == num) return true;
      }
    }

    return false;
  }
}
