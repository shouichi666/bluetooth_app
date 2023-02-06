import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'action.freezed.dart';
part 'action.g.dart';

@freezed
abstract class Action with _$Action {
  const factory Action({
    @Default('') String id,
    @Default('') String name,
    @Default('') String url,
    @Default(false) bool isDoned,
    @Default(null) @TimestampConverter() DateTime? createAt,
    @Default(null) @TimestampConverter() DateTime? updateAt,
  }) = _Action;

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic timestamp) {
    return timestamp.toDate();
  }

  // nullの時は toJson 時 FieldValue.serverTimestamp() を返すことで、createdAt の挙動になる
  @override
  dynamic toJson(DateTime? dateTime) {
    return FieldValue.serverTimestamp();
  }
}
