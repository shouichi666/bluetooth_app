import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit/repository/local_notification_reposiotory.dart';
import 'package:habit/utilry/log/log.dart';

final localNotificationControllerProvider =
    StateNotifierProvider<LocalNotificationController, List<PendingNotificationRequest>>(
  (ref) => LocalNotificationController(ref),
);

class LocalNotificationController
    extends StateNotifier<List<PendingNotificationRequest>> {
  LocalNotificationController(this.ref) : super([]) {
    _init();
  }

  final Ref ref;
  late LocalNotificationRepository _local;

  //設定されているアラームのいちらん
  _init() async {
    _local = LocalNotificationRepository();
    _local.init();
    state = await _local.pending();

    pd(state[0].id);
  }

  set() {
    _local.setNotification();
  }

  removeAll() {
    _local.removeAll();
  }
}
