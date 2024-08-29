import 'dart:math';

class SudokuGenerator {
  final int size = 9;
  final List<int> numbers = List<int>.generate(9, (index) => index + 1);
  List<List<int>> sudoku;

  SudokuGenerator() : sudoku = List.generate(9, (_) => List<int>.filled(9, 0));

  List<List<int>> generateSudoku() {
    _fillDiagonalBlocks();
    _fillRemainingCells(0, 3);
    return sudoku;
  }

  void _fillDiagonalBlocks() {
    for (int i = 0; i < size; i += 3) {
      _fillBlock(i, i);
    }
  }

  void _fillBlock(int row, int col) {
    List<int> shuffledNumbers = List.from(numbers)..shuffle(Random());
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        sudoku[row + i][col + j] = shuffledNumbers[i * 3 + j];
      }
    }
  }

  bool _fillRemainingCells(int row, int col) {
    if (row == size - 1 && col == size) return true;
    if (col == size) {
      row++;
      col = 0;
    }

    if (sudoku[row][col] != 0) return _fillRemainingCells(row, col + 1);

    for (int num in _getRandomNumbers()) {
      if (_isSafeToPlace(sudoku, row, col, num)) {
        sudoku[row][col] = num;
        if (_fillRemainingCells(row, col + 1)) return true;
        sudoku[row][col] = 0;
      }
    }
    return false;
  }

  List<int> _getRandomNumbers() {
    List<int> nums = List.from(numbers);
    nums.shuffle();
    return nums;
  }

  bool _isSafeToPlace(List<List<int>> grid, int row, int col, int num) {
    return !_isUsedInRow(grid, row, num) &&
        !_isUsedInCol(grid, col, num) &&
        !_isUsedInBox(grid, row - row % 3, col - col % 3, num);
  }

  bool _isUsedInRow(List<List<int>> grid, int row, int num) {
    return grid[row].contains(num);
  }

  bool _isUsedInCol(List<List<int>> grid, int col, int num) {
    for (int i = 0; i < size; i++) {
      if (grid[i][col] == num) return true;
    }
    return false;
  }

  bool _isUsedInBox(
      List<List<int>> grid, int boxStartRow, int boxStartCol, int num) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[boxStartRow + i][boxStartCol + j] == num) return true;
      }
    }
    return false;
  }

  List<List<int>> removeCells(int count) {
    Random rand = Random();
    while (count > 0) {
      int row = rand.nextInt(size);
      int col = rand.nextInt(size);
      int backup = sudoku[row][col];

      if (sudoku[row][col] != 0) {
        // Only remove if the cell is not already empty
        sudoku[row][col] = 0;

        if (!hasUniqueSolution()) {
          // If the puzzle is not solvable or has multiple solutions, undo the removal
          sudoku[row][col] = backup;
        } else {
          count--;
        }
      }
    }
    return sudoku;
  }

  bool hasUniqueSolution() {
    List<List<int>> sudokuCopy =
        List.generate(size, (i) => List<int>.from(sudoku[i]));
    int solutionCount = _countSolutions(sudokuCopy);
    return solutionCount == 1;
  }

  int _countSolutions(List<List<int>> grid) {
    for (int row = 0; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if (grid[row][col] == 0) {
          for (int num in numbers) {
            if (_isSafeToPlace(grid, row, col, num)) {
              grid[row][col] = num;
              int result = _countSolutions(grid);
              grid[row][col] = 0; // Backtrack

              if (result == 1) {
                return 1; // Found one valid solution
              } else if (result > 1) {
                return 2; // Found more than one solution
              }
            }
          }
          return 0;
        }
      }
    }
    return 1;
  }
}
