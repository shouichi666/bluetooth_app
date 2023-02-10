// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IntervalState _$IntervalStateFromJson(Map<String, dynamic> json) {
  return IintervalState.fromJson(json);
}

/// @nodoc
mixin _$IntervalState {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntervalStateCopyWith<IntervalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntervalStateCopyWith<$Res> {
  factory $IntervalStateCopyWith(
          IntervalState value, $Res Function(IntervalState) then) =
      _$IntervalStateCopyWithImpl<$Res, IntervalState>;
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class _$IntervalStateCopyWithImpl<$Res, $Val extends IntervalState>
    implements $IntervalStateCopyWith<$Res> {
  _$IntervalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IintervalStateCopyWith<$Res>
    implements $IntervalStateCopyWith<$Res> {
  factory _$$IintervalStateCopyWith(
          _$IintervalState value, $Res Function(_$IintervalState) then) =
      __$$IintervalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class __$$IintervalStateCopyWithImpl<$Res>
    extends _$IntervalStateCopyWithImpl<$Res, _$IintervalState>
    implements _$$IintervalStateCopyWith<$Res> {
  __$$IintervalStateCopyWithImpl(
      _$IintervalState _value, $Res Function(_$IintervalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$IintervalState(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IintervalState with DiagnosticableTreeMixin implements IintervalState {
  const _$IintervalState({this.label = '', this.value = 0.0});

  factory _$IintervalState.fromJson(Map<String, dynamic> json) =>
      _$$IintervalStateFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final double value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IntervalState(label: $label, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IntervalState'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IintervalState &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IintervalStateCopyWith<_$IintervalState> get copyWith =>
      __$$IintervalStateCopyWithImpl<_$IintervalState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IintervalStateToJson(
      this,
    );
  }
}

abstract class IintervalState implements IntervalState {
  const factory IintervalState({final String label, final double value}) =
      _$IintervalState;

  factory IintervalState.fromJson(Map<String, dynamic> json) =
      _$IintervalState.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$IintervalStateCopyWith<_$IintervalState> get copyWith =>
      throw _privateConstructorUsedError;
}
