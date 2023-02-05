import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'local_noftification.freezed.dart';
part 'local_noftification.g.dart';

@freezed
abstract class LocalNotificationState with _$LocalNotificationState {
  const factory LocalNotificationState({
    @Default([]) List<Object> reserve,
  }) = _LocalNotificationState;

  factory LocalNotificationState.fromJson(Map<String, dynamic> json) =>
      _$LocalNotificationStateFromJson(json);
}
