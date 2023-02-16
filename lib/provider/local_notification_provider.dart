import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:habit/repository/local_notification_reposiotory.dart';
import 'package:url_launcher/url_launcher.dart';

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

  //設定されているアラームの一覧
  _init() async {
    _localNotification = LocalNotificationRepository();
    _localNotification.init();
    state = await _localNotification.pending();

    LocalNotificationRepository.onNotifications.listen((value) async {
      final url = Uri.parse(
        'https://pnt.tsukasa.cloud/user/comm/id/XEqIMK1mfQOKlYjocHoM2KKH7Tj2/?id=23',
      );
      !await launchUrl(url);
    });
  }

  listen() {}

  show({
    required String id,
    required String title,
    required String body,
  }) async {
    await _localNotification.show(
      id: int.parse(id),
      title: title,
      body: body,
      payload: 'payload',
    );
  }

  set() {
    _localNotification.setNotification();
  }

  removeAll() {
    _localNotification.removeAll();
  }
}
