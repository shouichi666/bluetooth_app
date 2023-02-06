// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Action _$$_ActionFromJson(Map<String, dynamic> json) => _$_Action(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      isDoned: json['isDoned'] as bool? ?? false,
      createAt: json['createAt'] == null
          ? null
          : const TimestampConverter().fromJson(json['createAt']),
      updateAt: json['updateAt'] == null
          ? null
          : const TimestampConverter().fromJson(json['updateAt']),
    );

Map<String, dynamic> _$$_ActionToJson(_$_Action instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'isDoned': instance.isDoned,
      'createAt': const TimestampConverter().toJson(instance.createAt),
      'updateAt': const TimestampConverter().toJson(instance.updateAt),
    };
