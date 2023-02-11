// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'beacon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeaconState _$$_BeaconStateFromJson(Map<String, dynamic> json) =>
    _$_BeaconState(
      uuid: json['uuid'] as String? ?? '',
      scanBeacon: json['scanBeacon'] == null
          ? const ScanBeacon()
          : ScanBeacon.fromJson(json['scanBeacon'] as Map<String, dynamic>),
      broadcasBeacon: json['broadcasBeacon'] == null
          ? const BroadcastBeacon()
          : BroadcastBeacon.fromJson(
              json['broadcasBeacon'] as Map<String, dynamic>),
      isScaning: json['isScaning'] as bool? ?? false,
      isBroadcasting: json['isBroadcasting'] as bool? ?? true,
      isSomePermission: json['isSomePermission'] as bool? ?? true,
    );

Map<String, dynamic> _$$_BeaconStateToJson(_$_BeaconState instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'scanBeacon': instance.scanBeacon,
      'broadcasBeacon': instance.broadcasBeacon,
      'isScaning': instance.isScaning,
      'isBroadcasting': instance.isBroadcasting,
      'isSomePermission': instance.isSomePermission,
    };

_$_ScanBeacon _$$_ScanBeaconFromJson(Map<String, dynamic> json) =>
    _$_ScanBeacon(
      uuid: json['uuid'] as String? ?? '',
      major: json['major'] as int? ?? -1,
      minor: json['minor'] as int? ?? -1,
      rssi: json['rssi'] as int? ?? 0,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      proximity: json['proximity'] as String? ?? '',
    );

Map<String, dynamic> _$$_ScanBeaconToJson(_$_ScanBeacon instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'major': instance.major,
      'minor': instance.minor,
      'rssi': instance.rssi,
      'accuracy': instance.accuracy,
      'proximity': instance.proximity,
    };

_$_BroadcastBeacon _$$_BroadcastBeaconFromJson(Map<String, dynamic> json) =>
    _$_BroadcastBeacon(
      uuid: json['uuid'] as String? ?? '',
      major: json['major'] as int? ?? -1,
      minor: json['minor'] as int? ?? -1,
    );

Map<String, dynamic> _$$_BroadcastBeaconToJson(_$_BroadcastBeacon instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'major': instance.major,
      'minor': instance.minor,
    };
