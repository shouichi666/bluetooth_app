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
  late LocalNotificationRepository _localNotification;

  //設定されているアラームのいちらん
  _init() async {
    _localNotification = LocalNotificationRepository();
    _localNotification.init();
    state = await _localNotification.pending();

    pd(state[state.length - 1].id);
  }

  set() {
    _localNotification.setNotification();
  }

  removeAll() {
    _localNotification.removeAll();
  }
}
