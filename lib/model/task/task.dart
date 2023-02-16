import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:habit/model/action/action.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    @Default('') String id,
    @Default('') String label,
    @Default(false) bool isDoned,
    @Default(null) @TimestampConverter() DateTime? runAt,
    @Default(null) @TimestampConverter() DateTime? updateAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
