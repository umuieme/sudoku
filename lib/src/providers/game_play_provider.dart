import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku_mordern/src/config/sudoku_generator.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/providers/cell_selection_provider.dart';
import 'package:sudoku_mordern/src/providers/game_difficulty_provider.dart';
import 'package:sudoku_mordern/src/providers/game_end_provider.dart';
import 'package:sudoku_mordern/src/providers/game_score/game_score_provider.dart';
import 'package:sudoku_mordern/src/providers/game_timer_provider.dart';

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
        completeSudoko[i].add(CellValue(
          x: i,
          y: j,
          value: sudokuValue[i][j],
        ));
      }
    }
    final difficulty = ref.watch(gameDifficultyNotifierProvider);
    final unsolvedSudoku =
        generator.removeCells(difficulty.getRandomCellsToRemove());
    final List<List<CellValue>> unsolved = [];
    for (var i = 0; i < unsolvedSudoku.length; i++) {
      unsolved.add([]);
      for (var j = 0; j < unsolvedSudoku[i].length; j++) {
        unsolved[i].add(CellValue(
            x: i,
            y: j,
            value: sudokuValue[i][j],
            isGenerated: sudokuValue[i][j] != 0));
      }
    }
    return unsolved;
  }

  void updateCellValue(int value) {
    final selectedCell = ref.read(cellSelectionNotifierProvider);

    final cell = selectedCell.copyWith(value: value);
    final list = state;
    list[cell.x][cell.y] = cell;
    // final hasInvalidCell = checkValidPosition(list, cell);
    state = [...list];
    // if (hasInvalidCell) {
    //   return;
    // }
    final isCompleted = checkGameOver();
    if (isCompleted) {
      final difficulty = ref.watch(gameDifficultyNotifierProvider);
      final time = ref.read(gameTimerNotifierProvider).$1;

      ref
          .read(gameScoreNotifierProvider.notifier)
          .updateScore(difficulty, time);
      ref.read(gameEndNotifierProvider.notifier).updateGameOver();
    }
  }

  // used to mark the cell as invalid cell with duplicate value
  // TODO need better implementation
  // ignore: unused_element
  bool _checkValidPosition(List<List<CellValue>> data, CellValue selectedCell) {
    bool hasInvalidCell = false;
    for (final cell in data[selectedCell.x]) {
      if (cell.isSelected(selectedCell.x, selectedCell.y)) continue;
      if (cell.value == selectedCell.value) {
        data[cell.x][cell.y] = cell.copyWith(isInvalid: true);
        hasInvalidCell = true;
      }
    }

    for (var i = 0; i < data.length; i++) {
      final cell = data[i][selectedCell.y];
      if (cell.isSelected(selectedCell.x, selectedCell.y)) continue;
      if (cell.value == selectedCell.value) {
        data[cell.x][cell.y] = cell.copyWith(isInvalid: true);
        hasInvalidCell = true;
      }
    }

    int blockStartX = selectedCell.x - selectedCell.x % 3;
    int blockStartY = selectedCell.y - selectedCell.y % 3;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        final cell = data[blockStartX + i][blockStartY + j];
        if (cell.isSelected(selectedCell.x, selectedCell.y)) continue;
        if (cell.value == selectedCell.value) {
          data[cell.x][cell.y] = cell.copyWith(isInvalid: true);
          hasInvalidCell = true;
        }
      }
    }
    data[selectedCell.x][selectedCell.y] =
        selectedCell.copyWith(isInvalid: hasInvalidCell);

    return hasInvalidCell;
  }

  bool checkGameOver() {
    for (var i = 0; i < completeSudoko.length; i++) {
      for (var j = 0; j < completeSudoko[i].length; j++) {
        if (completeSudoko[i][j].value != state[i][j].value) {
          return false;
        }
      }
    }
    return true;
  }

  // TODO add funcitonality to show error cell

  // bool _isSafeToPlace(List<List<CellValue>> grid, int row, int col, int num) {
  //   return !_isUsedInRow(grid, row, num) &&
  //       !_isUsedInCol(grid, col, num) &&
  //       !_isUsedInBox(grid, row - row % 3, col - col % 3, num);
  // }

  // bool _isUsedInRow(List<List<CellValue>> grid, int row, int num) {
  //   return grid[row]
  //           .firstWhere(
  //             (element) => element.value == num,
  //             orElse: () => CellValue.empty(),
  //           )
  //           .value !=
  //       -1;
  // }

  // bool _isUsedInCol(List<List<CellValue>> grid, int col, int num) {
  //   for (int i = 0; i < grid.length; i++) {
  //     if (grid[i][col].value == num) return true;
  //   }
  //   return false;
  // }

  // bool _isUsedInBox(
  //     List<List<CellValue>> grid, int boxStartRow, int boxStartCol, int num) {
  //   for (int i = 0; i < 3; i++) {
  //     for (int j = 0; j < 3; j++) {
  //       if (grid[boxStartRow + i][boxStartCol + j].value == num) return true;
  //     }
  //   }

  //   return false;
  // }
}
