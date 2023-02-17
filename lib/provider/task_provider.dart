import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit/model/task/task.dart';
import 'package:habit/provider/beacon_provider.dart';
import 'package:habit/provider/common_provider.dart';
import 'package:habit/provider/local_notification_provider.dart';
import 'package:habit/utilry/log/log.dart';

final taskControllerProvider =
    StateNotifierProvider<TaskController, AsyncValue<List<Task>>>((ref) {
  return TaskController(ref);
});

class TaskController extends StateNotifier<AsyncValue<List<Task>>> {
  TaskController(this._ref) : super(const AsyncLoading()) {
    _init();
  }

  final Ref _ref;

  _init() async {
    final stream = _ref.read(storeRepositoryProvider).relativeTasks();

    stream.listen((event) {
      state = AsyncData(event);
    });

    _ref.listen(beaconControllerProvider, (previous, next) async {
      for (var task in state.value ?? []) {
        if (isRun(task) &&
            next.isScaning &&
            (next.scanBeacon.proximity == 'immediate' ||
                next.scanBeacon.proximity == 'near')) {
          //
          await runTask(task);
        }
      }
    });
  }

  runTask(Task t) async {
    final copy = state.value;

    if (copy == null) return;

    final task = t.copyWith(
      isDoned: true,
      runAt: DateTime.now(),
      updateAt: DateTime.now(),
    );

    await _ref.read(storeRepositoryProvider).postTask(task);

    state = AsyncData(
      [
        for (final t in copy)
          if (t.id == task.id) task else t,
      ],
    );

    _ref.read(localNotificationControllerProvider.notifier).show(
          id: task.id,
          title: task.label,
          body: task.updateAt.toString(),
        );
  }

  editTask(Task t) async {}

  bool isRun(Task task) {
    final now = DateTime.now();

    final runAt = task.runAt ?? now;

    final diff = runAt.difference(now);

    pd(diff.inHours);

    final isRuntime23Before = diff.inHours < -23;

    return isRuntime23Before;
  }
}
