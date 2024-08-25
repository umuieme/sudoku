import 'package:flutter/material.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_cell.dart';

class GameRow extends StatelessWidget {
  final List<CellValue> row;
  const GameRow({super.key, required this.row});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: row
          .map((item) => GameCell(
                cellValue: item,
              ))
          .toList(),
    );
  }
}
