// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QRState _$QRStateFromJson(Map<String, dynamic> json) {
  return _QRState.fromJson(json);
}

/// @nodoc
mixin _$QRState {
  String? get result => throw _privateConstructorUsedError;
  bool get isFlash => throw _privateConstructorUsedError;
  bool get isScan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QRStateCopyWith<QRState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRStateCopyWith<$Res> {
  factory $QRStateCopyWith(QRState value, $Res Function(QRState) then) =
      _$QRStateCopyWithImpl<$Res, QRState>;
  @useResult
  $Res call({String? result, bool isFlash, bool isScan});
}

/// @nodoc
class _$QRStateCopyWithImpl<$Res, $Val extends QRState>
    implements $QRStateCopyWith<$Res> {
  _$QRStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? isFlash = null,
    Object? isScan = null,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlash: null == isFlash
          ? _value.isFlash
          : isFlash // ignore: cast_nullable_to_non_nullable
              as bool,
      isScan: null == isScan
          ? _value.isScan
          : isScan // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QRStateCopyWith<$Res> implements $QRStateCopyWith<$Res> {
  factory _$$_QRStateCopyWith(
          _$_QRState value, $Res Function(_$_QRState) then) =
      __$$_QRStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? result, bool isFlash, bool isScan});
}

/// @nodoc
class __$$_QRStateCopyWithImpl<$Res>
    extends _$QRStateCopyWithImpl<$Res, _$_QRState>
    implements _$$_QRStateCopyWith<$Res> {
  __$$_QRStateCopyWithImpl(_$_QRState _value, $Res Function(_$_QRState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? isFlash = null,
    Object? isScan = null,
  }) {
    return _then(_$_QRState(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlash: null == isFlash
          ? _value.isFlash
          : isFlash // ignore: cast_nullable_to_non_nullable
              as bool,
      isScan: null == isScan
          ? _value.isScan
          : isScan // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QRState with DiagnosticableTreeMixin implements _QRState {
  const _$_QRState(
      {this.result = null, this.isFlash = false, this.isScan = false});

  factory _$_QRState.fromJson(Map<String, dynamic> json) =>
      _$$_QRStateFromJson(json);

  @override
  @JsonKey()
  final String? result;
  @override
  @JsonKey()
  final bool isFlash;
  @override
  @JsonKey()
  final bool isScan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QRState(result: $result, isFlash: $isFlash, isScan: $isScan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QRState'))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('isFlash', isFlash))
      ..add(DiagnosticsProperty('isScan', isScan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QRState &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.isFlash, isFlash) || other.isFlash == isFlash) &&
            (identical(other.isScan, isScan) || other.isScan == isScan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, isFlash, isScan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QRStateCopyWith<_$_QRState> get copyWith =>
      __$$_QRStateCopyWithImpl<_$_QRState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QRStateToJson(
      this,
    );
  }
}

abstract class _QRState implements QRState {
  const factory _QRState(
      {final String? result,
      final bool isFlash,
      final bool isScan}) = _$_QRState;

  factory _QRState.fromJson(Map<String, dynamic> json) = _$_QRState.fromJson;

  @override
  String? get result;
  @override
  bool get isFlash;
  @override
  bool get isScan;
  @override
  @JsonKey(ignore: true)
  _$$_QRStateCopyWith<_$_QRState> get copyWith =>
      throw _privateConstructorUsedError;
}
