// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerState _$$_TimerStateFromJson(Map<String, dynamic> json) =>
    _$_TimerState(
      hour: json['hour'] as String? ?? '00',
      min: json['min'] as String? ?? '00',
      sec: json['sec'] as String? ?? '00',
    );

Map<String, dynamic> _$$_TimerStateToJson(_$_TimerState instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'min': instance.min,
      'sec': instance.sec,
    };
