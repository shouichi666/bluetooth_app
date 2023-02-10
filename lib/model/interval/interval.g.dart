// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IintervalState _$$IintervalStateFromJson(Map<String, dynamic> json) =>
    _$IintervalState(
      label: json['label'] as String? ?? '',
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$IintervalStateToJson(_$IintervalState instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
