import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'timer.freezed.dart';
part 'timer.g.dart';

@freezed
abstract class TimerState with _$TimerState {
  const factory TimerState({
    @Default('00') String hour,
    @Default('00') String min,
    @Default('00') String sec,
  }) = _TimerState;

  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);
}
