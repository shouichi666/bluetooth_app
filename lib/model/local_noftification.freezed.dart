// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_noftification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalNotificationState _$LocalNotificationStateFromJson(
    Map<String, dynamic> json) {
  return _LocalNotificationState.fromJson(json);
}

/// @nodoc
mixin _$LocalNotificationState {
  List<Object> get reserve => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalNotificationStateCopyWith<LocalNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalNotificationStateCopyWith<$Res> {
  factory $LocalNotificationStateCopyWith(LocalNotificationState value,
          $Res Function(LocalNotificationState) then) =
      _$LocalNotificationStateCopyWithImpl<$Res, LocalNotificationState>;
  @useResult
  $Res call({List<Object> reserve});
}

/// @nodoc
class _$LocalNotificationStateCopyWithImpl<$Res,
        $Val extends LocalNotificationState>
    implements $LocalNotificationStateCopyWith<$Res> {
  _$LocalNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reserve = null,
  }) {
    return _then(_value.copyWith(
      reserve: null == reserve
          ? _value.reserve
          : reserve // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalNotificationStateCopyWith<$Res>
    implements $LocalNotificationStateCopyWith<$Res> {
  factory _$$_LocalNotificationStateCopyWith(_$_LocalNotificationState value,
          $Res Function(_$_LocalNotificationState) then) =
      __$$_LocalNotificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Object> reserve});
}

/// @nodoc
class __$$_LocalNotificationStateCopyWithImpl<$Res>
    extends _$LocalNotificationStateCopyWithImpl<$Res,
        _$_LocalNotificationState>
    implements _$$_LocalNotificationStateCopyWith<$Res> {
  __$$_LocalNotificationStateCopyWithImpl(_$_LocalNotificationState _value,
      $Res Function(_$_LocalNotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reserve = null,
  }) {
    return _then(_$_LocalNotificationState(
      reserve: null == reserve
          ? _value._reserve
          : reserve // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalNotificationState
    with DiagnosticableTreeMixin
    implements _LocalNotificationState {
  const _$_LocalNotificationState({final List<Object> reserve = const []})
      : _reserve = reserve;

  factory _$_LocalNotificationState.fromJson(Map<String, dynamic> json) =>
      _$$_LocalNotificationStateFromJson(json);

  final List<Object> _reserve;
  @override
  @JsonKey()
  List<Object> get reserve {
    if (_reserve is EqualUnmodifiableListView) return _reserve;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reserve);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalNotificationState(reserve: $reserve)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalNotificationState'))
      ..add(DiagnosticsProperty('reserve', reserve));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalNotificationState &&
            const DeepCollectionEquality().equals(other._reserve, _reserve));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reserve));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalNotificationStateCopyWith<_$_LocalNotificationState> get copyWith =>
      __$$_LocalNotificationStateCopyWithImpl<_$_LocalNotificationState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalNotificationStateToJson(
      this,
    );
  }
}

abstract class _LocalNotificationState implements LocalNotificationState {
  const factory _LocalNotificationState({final List<Object> reserve}) =
      _$_LocalNotificationState;

  factory _LocalNotificationState.fromJson(Map<String, dynamic> json) =
      _$_LocalNotificationState.fromJson;

  @override
  List<Object> get reserve;
  @override
  @JsonKey(ignore: true)
  _$$_LocalNotificationStateCopyWith<_$_LocalNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
