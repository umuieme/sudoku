import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/ui/widgets/game_cell.dart';

class GameRow extends StatelessWidget {
  final List<CellValue> row;
  const GameRow({super.key, required this.row});

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [];
    for (var i = 0; i < row.length; i++) {
      list.add(GameCell(cellValue: row[i]));
    }
    return SizedBox(
      height: 34.w,
      child: Row(
        children: row
            .map(
              (e) => GameCell(cellValue: e),
            )
            .toList(),
      ),
    );
  }
}
