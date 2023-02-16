// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get isDoned => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get runAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String label,
      bool isDoned,
      @TimestampConverter() DateTime? runAt,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? isDoned = null,
    Object? runAt = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isDoned: null == isDoned
          ? _value.isDoned
          : isDoned // ignore: cast_nullable_to_non_nullable
              as bool,
      runAt: freezed == runAt
          ? _value.runAt
          : runAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      bool isDoned,
      @TimestampConverter() DateTime? runAt,
      @TimestampConverter() DateTime? updateAt});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? isDoned = null,
    Object? runAt = freezed,
    Object? updateAt = freezed,
  }) {
    return _then(_$_Task(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isDoned: null == isDoned
          ? _value.isDoned
          : isDoned // ignore: cast_nullable_to_non_nullable
              as bool,
      runAt: freezed == runAt
          ? _value.runAt
          : runAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task with DiagnosticableTreeMixin implements _Task {
  const _$_Task(
      {this.id = '',
      this.label = '',
      this.isDoned = false,
      @TimestampConverter() this.runAt = null,
      @TimestampConverter() this.updateAt = null});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final bool isDoned;
  @override
  @JsonKey()
  @TimestampConverter()
  final DateTime? runAt;
  @override
  @JsonKey()
  @TimestampConverter()
  final DateTime? updateAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(id: $id, label: $label, isDoned: $isDoned, runAt: $runAt, updateAt: $updateAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('isDoned', isDoned))
      ..add(DiagnosticsProperty('runAt', runAt))
      ..add(DiagnosticsProperty('updateAt', updateAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isDoned, isDoned) || other.isDoned == isDoned) &&
            (identical(other.runAt, runAt) || other.runAt == runAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, isDoned, runAt, updateAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {final String id,
      final String label,
      final bool isDoned,
      @TimestampConverter() final DateTime? runAt,
      @TimestampConverter() final DateTime? updateAt}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  bool get isDoned;
  @override
  @TimestampConverter()
  DateTime? get runAt;
  @override
  @TimestampConverter()
  DateTime? get updateAt;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
