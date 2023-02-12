import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'qr.g.dart';
part 'qr.freezed.dart';

@freezed
abstract class QRState with _$QRState {
  const factory QRState({
    @Default(null) String? result,
    @Default(false) bool isFlash,
    @Default(false) bool isScan,
  }) = _QRState;

  factory QRState.fromJson(Map<String, dynamic> json) => _$QRStateFromJson(json);
}
