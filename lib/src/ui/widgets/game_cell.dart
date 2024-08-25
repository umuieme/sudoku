import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/providers/cell_selection_provider.dart';

class GameCell extends ConsumerWidget {
  final CellValue cellValue;

  const GameCell({
    super.key,
    required this.cellValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCell = ref.watch(cellSelectionNotifierProvider);
    final isSelected =
        cellValue.x == selectedCell.x && cellValue.y == selectedCell.y;
    return InkWell(
      onTap: () => ref
          .read(cellSelectionNotifierProvider.notifier)
          .selectCell(cellValue),
      child: Container(
        height: 35.w,
        width: 35.w,
        margin: EdgeInsets.all(2.r),
        padding: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : Colors.white,
        ),
        child: Center(
          child: Text(
            "${cellValue.value}",
            style: context.textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
