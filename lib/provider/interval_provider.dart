import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit/model/interval/interval.dart';

final intervalControllerProvider =
    StateNotifierProvider<IntervalController, IntervalState>((ref) {
  return IntervalController(ref);
});

class IntervalController extends StateNotifier<IntervalState> {
  IntervalController(this._ref) : super(const IntervalState()) {
    _init();
  }

  final Ref _ref;

  _init() async {
    _ref;

    state = state.copyWith(
      label: 'Unknown',
    );
  }

  fetch() async {}

  dynamic onChangeValue(double val) {
    const oneThird = 100 / 3;

    if (0.0 < val && val < oneThird) {
      state = state.copyWith(
        value: val,
        label: 'Short',
      );
    } else if (oneThird <= val && val < oneThird * 2) {
      state = state.copyWith(
        value: val,
        label: 'Average',
      );
    } else {
      state = state.copyWith(
        value: val,
        label: 'Lengthy',
      );
    }
  }
}
