// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cell_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CellValue {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Create a copy of CellValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CellValueCopyWith<CellValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellValueCopyWith<$Res> {
  factory $CellValueCopyWith(CellValue value, $Res Function(CellValue) then) =
      _$CellValueCopyWithImpl<$Res, CellValue>;
  @useResult
  $Res call({int x, int y, int value});
}

/// @nodoc
class _$CellValueCopyWithImpl<$Res, $Val extends CellValue>
    implements $CellValueCopyWith<$Res> {
  _$CellValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CellValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CellValueImplCopyWith<$Res>
    implements $CellValueCopyWith<$Res> {
  factory _$$CellValueImplCopyWith(
          _$CellValueImpl value, $Res Function(_$CellValueImpl) then) =
      __$$CellValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y, int value});
}

/// @nodoc
class __$$CellValueImplCopyWithImpl<$Res>
    extends _$CellValueCopyWithImpl<$Res, _$CellValueImpl>
    implements _$$CellValueImplCopyWith<$Res> {
  __$$CellValueImplCopyWithImpl(
      _$CellValueImpl _value, $Res Function(_$CellValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of CellValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? value = null,
  }) {
    return _then(_$CellValueImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CellValueImpl implements _CellValue {
  _$CellValueImpl({required this.x, required this.y, required this.value});

  @override
  final int x;
  @override
  final int y;
  @override
  final int value;

  @override
  String toString() {
    return 'CellValue(x: $x, y: $y, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CellValueImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, value);

  /// Create a copy of CellValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CellValueImplCopyWith<_$CellValueImpl> get copyWith =>
      __$$CellValueImplCopyWithImpl<_$CellValueImpl>(this, _$identity);
}

abstract class _CellValue implements CellValue {
  factory _CellValue(
      {required final int x,
      required final int y,
      required final int value}) = _$CellValueImpl;

  @override
  int get x;
  @override
  int get y;
  @override
  int get value;

  /// Create a copy of CellValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CellValueImplCopyWith<_$CellValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
