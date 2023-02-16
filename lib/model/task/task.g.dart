// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String? ?? '',
      label: json['label'] as String? ?? '',
      isDoned: json['isDoned'] as bool? ?? false,
      runAt: json['runAt'] == null
          ? null
          : const TimestampConverter().fromJson(json['runAt']),
      updateAt: json['updateAt'] == null
          ? null
          : const TimestampConverter().fromJson(json['updateAt']),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'isDoned': instance.isDoned,
      'runAt': const TimestampConverter().toJson(instance.runAt),
      'updateAt': const TimestampConverter().toJson(instance.updateAt),
    };
