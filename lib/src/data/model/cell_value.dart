import 'package:freezed_annotation/freezed_annotation.dart';

part 'cell_value.freezed.dart';

@freezed
class CellValue with _$CellValue {
  CellValue._();
  factory CellValue({
    required int x,
    required int y,
    required int value,
    @Default(false) bool isGenerated,
    @Default(true) bool isDuplicated,
    @Default(false) bool isInvalid,
  }) = _CellValue;

  factory CellValue.empty() => CellValue(
        x: -1,
        y: -1,
        value: -1,
        isGenerated: false,
        isDuplicated: false,
      );

  bool isInSelectedGroup(int selectedX, int selectedY) {
    if (selectedX == -1 || selectedY == -1) return false;
    if (selectedX == x || selectedY == y) return true;
    if (selectedX ~/ 3 == x ~/ 3 && selectedY ~/ 3 == y ~/ 3) return true;
    return false;
  }

  String get textValue {
    return value == 0 ? "" : value.toString();
  }

  bool isSelected(int selectedX, int selectedY) {
    return selectedX == x && selectedY == y;
  }
}
