import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku_mordern/src/config/colors.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/data/model/cell_value.dart';
import 'package:sudoku_mordern/src/providers/cell_selection_provider.dart';

class GameCell extends ConsumerWidget {
  final CellValue cellValue;

  const GameCell({
    super.key,
    required this.cellValue,
  });

  Border getBorder(int x, int y) {
    BorderSide? bottomBorder = BorderSide.none;
    BorderSide? rightBorder = BorderSide.none;

    if (x < 8) {
      final isBlockBorder = (x + 1) % 3 == 0;
      bottomBorder = BorderSide(
          color: isBlockBorder ? AppColors.primary : Colors.white,
          width: isBlockBorder ? 2 : 1);
    }

    if (y < 8) {
      final isBlockBorder = (y + 1) % 3 == 0;

      rightBorder = BorderSide(
          color: isBlockBorder ? AppColors.primary : Colors.white,
          width: isBlockBorder ? 2 : 1);
    }
    return Border(bottom: bottomBorder, right: rightBorder);
  }

  Color _getBackgroundColor(CellValue currentCell, CellValue selectedCell) {
    if (currentCell.isSelected(selectedCell.x, selectedCell.y)) {
      return const Color(0xff045C4A);
    }
    if (cellValue.isInSelectedGroup(selectedCell.x, selectedCell.y)) {
      return const Color(0xff4FC3AC);
    }
    if (cellValue.isGenerated) {
      return const Color(0xffB4B4B4);
    }
    return const Color(0xffD7D7D7);
  }

  Color _getTextColor(CellValue currentCell, CellValue selectedCell) {
    if (cellValue.isGenerated) {
      return const Color(0xff5e5e5e);
    }

    if (currentCell.isSelected(selectedCell.x, selectedCell.y)) {
      return Colors.white;
    }

    if (cellValue.isInSelectedGroup(selectedCell.x, selectedCell.y)) {
      return const Color(0xffe9e9e9);
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCell = ref.watch(cellSelectionNotifierProvider);

    return InkWell(
      onTap: cellValue.isGenerated
          ? null
          : () => ref
              .read(cellSelectionNotifierProvider.notifier)
              .selectCell(cellValue),
      child: Container(
        height: 34.w,
        width: 34.w,
        decoration: BoxDecoration(
            color: _getBackgroundColor(cellValue, selectedCell),
            border: getBorder(cellValue.x, cellValue.y)),
        child: Center(
          child: Text(
            cellValue.textValue,
            style: context.textTheme.headlineSmall?.copyWith(
              color: _getTextColor(cellValue, selectedCell),
            ),
          ),
        ),
      ),
    );
  }
}
