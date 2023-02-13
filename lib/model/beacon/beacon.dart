import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'beacon.g.dart';
part 'beacon.freezed.dart';

@freezed
abstract class BeaconState with _$BeaconState {
  const factory BeaconState({
    @Default(ScanBeacon()) ScanBeacon scanBeacon,
    @Default(BroadcastBeacon()) BroadcastBeacon broadcasBeacon,
    @Default([]) List<ScanBeacon> scanList,
    @Default(false) bool isScaning,
    @Default(true) bool isBroadcasting,
    @Default(true) bool isSomePermission,
    @Default(true) bool isScanLoading,
  }) = _BeaconState;

  factory BeaconState.fromJson(Map<String, dynamic> json) => _$BeaconStateFromJson(json);
}

@freezed
abstract class ScanBeacon with _$ScanBeacon {
  const factory ScanBeacon({
    @Default('') String uuid,
    @Default(-1) int major,
    @Default(-1) int minor,
    @Default(0) int rssi,
    @Default(0.0) double accuracy,
    @Default('') String proximity,
  }) = _ScanBeacon;

  factory ScanBeacon.fromJson(Map<String, dynamic> json) => _$ScanBeaconFromJson(json);
}

@freezed
abstract class BroadcastBeacon with _$BroadcastBeacon {
  const factory BroadcastBeacon({
    @Default('') String uuid,
    @Default(-1) int major,
    @Default(-1) int minor,
  }) = _BroadcastBeacon;

  factory BroadcastBeacon.fromJson(Map<String, dynamic> json) =>
      _$BroadcastBeaconFromJson(json);
}
