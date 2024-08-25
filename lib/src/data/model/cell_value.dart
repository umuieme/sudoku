import 'package:freezed_annotation/freezed_annotation.dart';

part 'cell_value.freezed.dart';

@freezed
class CellValue with _$CellValue {
  factory CellValue({
    required int x,
    required int y,
    required int value,
  }) = _CellValue;

  factory CellValue.empty() => CellValue(x: -1, y: -1, value: -1);

  // int get indexAtList => x * 9 + y;
}
