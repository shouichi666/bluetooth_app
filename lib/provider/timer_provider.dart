import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit/model/timer/timer.dart';

final timerControllerProvider = StateNotifierProvider<TimerController, TimerState>((ref) {
  return TimerController(ref);
});

class TimerController extends StateNotifier<TimerState> {
  TimerController(this._ref) : super(const TimerState()) {
    _init();
  }

  final Ref _ref;

  final List<String> _hourList = [];
  final List<String> _minList = [];
  final List<String> _secList = [];

  final hourScrollController = FixedExtentScrollController(initialItem: 0);
  final minScrollController = FixedExtentScrollController(initialItem: 0);
  final secScrollController = FixedExtentScrollController(initialItem: 0);

  List<String> get hourList => _hourList;
  List<String> get minList => _minList;
  List<String> get secList => _secList;

  @override
  void dispose() {
    hourScrollController.dispose();
    minScrollController.dispose();
    secScrollController.dispose();
    super.dispose();
  }

  _init() async {
    for (var i = 0; i < 24; i++) {
      _hourList.add(i.toString().padLeft(2, '0'));
    }
    for (var i = 0; i < 60; i++) {
      _minList.add(i.toString().padLeft(2, '0'));
      _secList.add(i.toString().padLeft(2, '0'));
    }

    _ref;
  }

  onChangeHour(int index) {
    HapticFeedback.lightImpact();
    state = state.copyWith(hour: _hourList[index]);
  }

  onChangeMinute(int index) {
    HapticFeedback.lightImpact();
    state = state.copyWith(min: _minList[index]);
  }

  onChangeSeconds(int index) {
    HapticFeedback.lightImpact();
    state = state.copyWith(sec: _secList[index]);
  }
}
