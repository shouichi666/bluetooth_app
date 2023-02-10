import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'interval.freezed.dart';
part 'interval.g.dart';

@freezed
abstract class IntervalState with _$IntervalState {
  const factory IntervalState({
    @Default('') String label,
    @Default(0.0) double value,
  }) = IintervalState;

  factory IntervalState.fromJson(Map<String, dynamic> json) =>
      _$IntervalStateFromJson(json);
}
