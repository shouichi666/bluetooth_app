// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beacon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeaconState _$BeaconStateFromJson(Map<String, dynamic> json) {
  return _BeaconState.fromJson(json);
}

/// @nodoc
mixin _$BeaconState {
  ScanBeacon get scanBeacon => throw _privateConstructorUsedError;
  BroadcastBeacon get broadcasBeacon => throw _privateConstructorUsedError;
  List<ScanBeacon> get scanList => throw _privateConstructorUsedError;
  bool get isScaning => throw _privateConstructorUsedError;
  bool get isBroadcasting => throw _privateConstructorUsedError;
  bool get isSomePermission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeaconStateCopyWith<BeaconState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeaconStateCopyWith<$Res> {
  factory $BeaconStateCopyWith(
          BeaconState value, $Res Function(BeaconState) then) =
      _$BeaconStateCopyWithImpl<$Res, BeaconState>;
  @useResult
  $Res call(
      {ScanBeacon scanBeacon,
      BroadcastBeacon broadcasBeacon,
      List<ScanBeacon> scanList,
      bool isScaning,
      bool isBroadcasting,
      bool isSomePermission});

  $ScanBeaconCopyWith<$Res> get scanBeacon;
  $BroadcastBeaconCopyWith<$Res> get broadcasBeacon;
}

/// @nodoc
class _$BeaconStateCopyWithImpl<$Res, $Val extends BeaconState>
    implements $BeaconStateCopyWith<$Res> {
  _$BeaconStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanBeacon = null,
    Object? broadcasBeacon = null,
    Object? scanList = null,
    Object? isScaning = null,
    Object? isBroadcasting = null,
    Object? isSomePermission = null,
  }) {
    return _then(_value.copyWith(
      scanBeacon: null == scanBeacon
          ? _value.scanBeacon
          : scanBeacon // ignore: cast_nullable_to_non_nullable
              as ScanBeacon,
      broadcasBeacon: null == broadcasBeacon
          ? _value.broadcasBeacon
          : broadcasBeacon // ignore: cast_nullable_to_non_nullable
              as BroadcastBeacon,
      scanList: null == scanList
          ? _value.scanList
          : scanList // ignore: cast_nullable_to_non_nullable
              as List<ScanBeacon>,
      isScaning: null == isScaning
          ? _value.isScaning
          : isScaning // ignore: cast_nullable_to_non_nullable
              as bool,
      isBroadcasting: null == isBroadcasting
          ? _value.isBroadcasting
          : isBroadcasting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSomePermission: null == isSomePermission
          ? _value.isSomePermission
          : isSomePermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScanBeaconCopyWith<$Res> get scanBeacon {
    return $ScanBeaconCopyWith<$Res>(_value.scanBeacon, (value) {
      return _then(_value.copyWith(scanBeacon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BroadcastBeaconCopyWith<$Res> get broadcasBeacon {
    return $BroadcastBeaconCopyWith<$Res>(_value.broadcasBeacon, (value) {
      return _then(_value.copyWith(broadcasBeacon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeaconStateCopyWith<$Res>
    implements $BeaconStateCopyWith<$Res> {
  factory _$$_BeaconStateCopyWith(
          _$_BeaconState value, $Res Function(_$_BeaconState) then) =
      __$$_BeaconStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScanBeacon scanBeacon,
      BroadcastBeacon broadcasBeacon,
      List<ScanBeacon> scanList,
      bool isScaning,
      bool isBroadcasting,
      bool isSomePermission});

  @override
  $ScanBeaconCopyWith<$Res> get scanBeacon;
  @override
  $BroadcastBeaconCopyWith<$Res> get broadcasBeacon;
}

/// @nodoc
class __$$_BeaconStateCopyWithImpl<$Res>
    extends _$BeaconStateCopyWithImpl<$Res, _$_BeaconState>
    implements _$$_BeaconStateCopyWith<$Res> {
  __$$_BeaconStateCopyWithImpl(
      _$_BeaconState _value, $Res Function(_$_BeaconState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanBeacon = null,
    Object? broadcasBeacon = null,
    Object? scanList = null,
    Object? isScaning = null,
    Object? isBroadcasting = null,
    Object? isSomePermission = null,
  }) {
    return _then(_$_BeaconState(
      scanBeacon: null == scanBeacon
          ? _value.scanBeacon
          : scanBeacon // ignore: cast_nullable_to_non_nullable
              as ScanBeacon,
      broadcasBeacon: null == broadcasBeacon
          ? _value.broadcasBeacon
          : broadcasBeacon // ignore: cast_nullable_to_non_nullable
              as BroadcastBeacon,
      scanList: null == scanList
          ? _value._scanList
          : scanList // ignore: cast_nullable_to_non_nullable
              as List<ScanBeacon>,
      isScaning: null == isScaning
          ? _value.isScaning
          : isScaning // ignore: cast_nullable_to_non_nullable
              as bool,
      isBroadcasting: null == isBroadcasting
          ? _value.isBroadcasting
          : isBroadcasting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSomePermission: null == isSomePermission
          ? _value.isSomePermission
          : isSomePermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BeaconState with DiagnosticableTreeMixin implements _BeaconState {
  const _$_BeaconState(
      {this.scanBeacon = const ScanBeacon(),
      this.broadcasBeacon = const BroadcastBeacon(),
      final List<ScanBeacon> scanList = const [],
      this.isScaning = false,
      this.isBroadcasting = true,
      this.isSomePermission = true})
      : _scanList = scanList;

  factory _$_BeaconState.fromJson(Map<String, dynamic> json) =>
      _$$_BeaconStateFromJson(json);

  @override
  @JsonKey()
  final ScanBeacon scanBeacon;
  @override
  @JsonKey()
  final BroadcastBeacon broadcasBeacon;
  final List<ScanBeacon> _scanList;
  @override
  @JsonKey()
  List<ScanBeacon> get scanList {
    if (_scanList is EqualUnmodifiableListView) return _scanList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scanList);
  }

  @override
  @JsonKey()
  final bool isScaning;
  @override
  @JsonKey()
  final bool isBroadcasting;
  @override
  @JsonKey()
  final bool isSomePermission;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeaconState(scanBeacon: $scanBeacon, broadcasBeacon: $broadcasBeacon, scanList: $scanList, isScaning: $isScaning, isBroadcasting: $isBroadcasting, isSomePermission: $isSomePermission)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeaconState'))
      ..add(DiagnosticsProperty('scanBeacon', scanBeacon))
      ..add(DiagnosticsProperty('broadcasBeacon', broadcasBeacon))
      ..add(DiagnosticsProperty('scanList', scanList))
      ..add(DiagnosticsProperty('isScaning', isScaning))
      ..add(DiagnosticsProperty('isBroadcasting', isBroadcasting))
      ..add(DiagnosticsProperty('isSomePermission', isSomePermission));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeaconState &&
            (identical(other.scanBeacon, scanBeacon) ||
                other.scanBeacon == scanBeacon) &&
            (identical(other.broadcasBeacon, broadcasBeacon) ||
                other.broadcasBeacon == broadcasBeacon) &&
            const DeepCollectionEquality().equals(other._scanList, _scanList) &&
            (identical(other.isScaning, isScaning) ||
                other.isScaning == isScaning) &&
            (identical(other.isBroadcasting, isBroadcasting) ||
                other.isBroadcasting == isBroadcasting) &&
            (identical(other.isSomePermission, isSomePermission) ||
                other.isSomePermission == isSomePermission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scanBeacon,
      broadcasBeacon,
      const DeepCollectionEquality().hash(_scanList),
      isScaning,
      isBroadcasting,
      isSomePermission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeaconStateCopyWith<_$_BeaconState> get copyWith =>
      __$$_BeaconStateCopyWithImpl<_$_BeaconState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeaconStateToJson(
      this,
    );
  }
}

abstract class _BeaconState implements BeaconState {
  const factory _BeaconState(
      {final ScanBeacon scanBeacon,
      final BroadcastBeacon broadcasBeacon,
      final List<ScanBeacon> scanList,
      final bool isScaning,
      final bool isBroadcasting,
      final bool isSomePermission}) = _$_BeaconState;

  factory _BeaconState.fromJson(Map<String, dynamic> json) =
      _$_BeaconState.fromJson;

  @override
  ScanBeacon get scanBeacon;
  @override
  BroadcastBeacon get broadcasBeacon;
  @override
  List<ScanBeacon> get scanList;
  @override
  bool get isScaning;
  @override
  bool get isBroadcasting;
  @override
  bool get isSomePermission;
  @override
  @JsonKey(ignore: true)
  _$$_BeaconStateCopyWith<_$_BeaconState> get copyWith =>
      throw _privateConstructorUsedError;
}

ScanBeacon _$ScanBeaconFromJson(Map<String, dynamic> json) {
  return _ScanBeacon.fromJson(json);
}

/// @nodoc
mixin _$ScanBeacon {
  String get uuid => throw _privateConstructorUsedError;
  int get major => throw _privateConstructorUsedError;
  int get minor => throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  String get proximity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanBeaconCopyWith<ScanBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanBeaconCopyWith<$Res> {
  factory $ScanBeaconCopyWith(
          ScanBeacon value, $Res Function(ScanBeacon) then) =
      _$ScanBeaconCopyWithImpl<$Res, ScanBeacon>;
  @useResult
  $Res call(
      {String uuid,
      int major,
      int minor,
      int rssi,
      double accuracy,
      String proximity});
}

/// @nodoc
class _$ScanBeaconCopyWithImpl<$Res, $Val extends ScanBeacon>
    implements $ScanBeaconCopyWith<$Res> {
  _$ScanBeaconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? major = null,
    Object? minor = null,
    Object? rssi = null,
    Object? accuracy = null,
    Object? proximity = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      proximity: null == proximity
          ? _value.proximity
          : proximity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScanBeaconCopyWith<$Res>
    implements $ScanBeaconCopyWith<$Res> {
  factory _$$_ScanBeaconCopyWith(
          _$_ScanBeacon value, $Res Function(_$_ScanBeacon) then) =
      __$$_ScanBeaconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      int major,
      int minor,
      int rssi,
      double accuracy,
      String proximity});
}

/// @nodoc
class __$$_ScanBeaconCopyWithImpl<$Res>
    extends _$ScanBeaconCopyWithImpl<$Res, _$_ScanBeacon>
    implements _$$_ScanBeaconCopyWith<$Res> {
  __$$_ScanBeaconCopyWithImpl(
      _$_ScanBeacon _value, $Res Function(_$_ScanBeacon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? major = null,
    Object? minor = null,
    Object? rssi = null,
    Object? accuracy = null,
    Object? proximity = null,
  }) {
    return _then(_$_ScanBeacon(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      proximity: null == proximity
          ? _value.proximity
          : proximity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScanBeacon with DiagnosticableTreeMixin implements _ScanBeacon {
  const _$_ScanBeacon(
      {this.uuid = '',
      this.major = -1,
      this.minor = -1,
      this.rssi = 0,
      this.accuracy = 0.0,
      this.proximity = ''});

  factory _$_ScanBeacon.fromJson(Map<String, dynamic> json) =>
      _$$_ScanBeaconFromJson(json);

  @override
  @JsonKey()
  final String uuid;
  @override
  @JsonKey()
  final int major;
  @override
  @JsonKey()
  final int minor;
  @override
  @JsonKey()
  final int rssi;
  @override
  @JsonKey()
  final double accuracy;
  @override
  @JsonKey()
  final String proximity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScanBeacon(uuid: $uuid, major: $major, minor: $minor, rssi: $rssi, accuracy: $accuracy, proximity: $proximity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScanBeacon'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('major', major))
      ..add(DiagnosticsProperty('minor', minor))
      ..add(DiagnosticsProperty('rssi', rssi))
      ..add(DiagnosticsProperty('accuracy', accuracy))
      ..add(DiagnosticsProperty('proximity', proximity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanBeacon &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.proximity, proximity) ||
                other.proximity == proximity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, major, minor, rssi, accuracy, proximity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanBeaconCopyWith<_$_ScanBeacon> get copyWith =>
      __$$_ScanBeaconCopyWithImpl<_$_ScanBeacon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScanBeaconToJson(
      this,
    );
  }
}

abstract class _ScanBeacon implements ScanBeacon {
  const factory _ScanBeacon(
      {final String uuid,
      final int major,
      final int minor,
      final int rssi,
      final double accuracy,
      final String proximity}) = _$_ScanBeacon;

  factory _ScanBeacon.fromJson(Map<String, dynamic> json) =
      _$_ScanBeacon.fromJson;

  @override
  String get uuid;
  @override
  int get major;
  @override
  int get minor;
  @override
  int get rssi;
  @override
  double get accuracy;
  @override
  String get proximity;
  @override
  @JsonKey(ignore: true)
  _$$_ScanBeaconCopyWith<_$_ScanBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}

BroadcastBeacon _$BroadcastBeaconFromJson(Map<String, dynamic> json) {
  return _BroadcastBeacon.fromJson(json);
}

/// @nodoc
mixin _$BroadcastBeacon {
  String get uuid => throw _privateConstructorUsedError;
  int get major => throw _privateConstructorUsedError;
  int get minor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BroadcastBeaconCopyWith<BroadcastBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BroadcastBeaconCopyWith<$Res> {
  factory $BroadcastBeaconCopyWith(
          BroadcastBeacon value, $Res Function(BroadcastBeacon) then) =
      _$BroadcastBeaconCopyWithImpl<$Res, BroadcastBeacon>;
  @useResult
  $Res call({String uuid, int major, int minor});
}

/// @nodoc
class _$BroadcastBeaconCopyWithImpl<$Res, $Val extends BroadcastBeacon>
    implements $BroadcastBeaconCopyWith<$Res> {
  _$BroadcastBeaconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? major = null,
    Object? minor = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BroadcastBeaconCopyWith<$Res>
    implements $BroadcastBeaconCopyWith<$Res> {
  factory _$$_BroadcastBeaconCopyWith(
          _$_BroadcastBeacon value, $Res Function(_$_BroadcastBeacon) then) =
      __$$_BroadcastBeaconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, int major, int minor});
}

/// @nodoc
class __$$_BroadcastBeaconCopyWithImpl<$Res>
    extends _$BroadcastBeaconCopyWithImpl<$Res, _$_BroadcastBeacon>
    implements _$$_BroadcastBeaconCopyWith<$Res> {
  __$$_BroadcastBeaconCopyWithImpl(
      _$_BroadcastBeacon _value, $Res Function(_$_BroadcastBeacon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? major = null,
    Object? minor = null,
  }) {
    return _then(_$_BroadcastBeacon(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BroadcastBeacon
    with DiagnosticableTreeMixin
    implements _BroadcastBeacon {
  const _$_BroadcastBeacon({this.uuid = '', this.major = -1, this.minor = -1});

  factory _$_BroadcastBeacon.fromJson(Map<String, dynamic> json) =>
      _$$_BroadcastBeaconFromJson(json);

  @override
  @JsonKey()
  final String uuid;
  @override
  @JsonKey()
  final int major;
  @override
  @JsonKey()
  final int minor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BroadcastBeacon(uuid: $uuid, major: $major, minor: $minor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BroadcastBeacon'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('major', major))
      ..add(DiagnosticsProperty('minor', minor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BroadcastBeacon &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, major, minor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BroadcastBeaconCopyWith<_$_BroadcastBeacon> get copyWith =>
      __$$_BroadcastBeaconCopyWithImpl<_$_BroadcastBeacon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BroadcastBeaconToJson(
      this,
    );
  }
}

abstract class _BroadcastBeacon implements BroadcastBeacon {
  const factory _BroadcastBeacon(
      {final String uuid,
      final int major,
      final int minor}) = _$_BroadcastBeacon;

  factory _BroadcastBeacon.fromJson(Map<String, dynamic> json) =
      _$_BroadcastBeacon.fromJson;

  @override
  String get uuid;
  @override
  int get major;
  @override
  int get minor;
  @override
  @JsonKey(ignore: true)
  _$$_BroadcastBeaconCopyWith<_$_BroadcastBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}
