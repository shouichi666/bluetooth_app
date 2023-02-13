import 'dart:convert';
import 'dart:io';

import 'package:habit/utilry/log/log.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
// import 'package:http/http.dart' as http;

class LocalNotificationRepository {
  LocalNotificationRepository();

  static final BehaviorSubject didReceiveLocalNotificationSubject = BehaviorSubject();

  static final BehaviorSubject<String?> onNotifications = BehaviorSubject<String?>();

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const _androidNotificationDetails = AndroidNotificationDetails(
    'Habit',
    '惰性通知',
    playSound: true,
    importance: Importance.max,
    priority: Priority.max,
  );

  static const _iosNotificationDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  static const _platformChannelSpecifics = NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iosNotificationDetails,
  );

  void init() async {
    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestPermission();

      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
            AndroidNotificationChannel(
              _androidNotificationDetails.channelId,
              _androidNotificationDetails.channelName,
              importance: _androidNotificationDetails.importance,
              enableVibration: _androidNotificationDetails.enableVibration,
              playSound: _androidNotificationDetails.playSound,
            ),
          );
    }

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // your call back to the UI
        pd(title ?? 'ooooooo');
      },
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse payload) async {
        final obj = {
          'id': payload.id,
          'actionId': payload.actionId,
          'payload': payload.payload,
          'notificationResponseType': payload.notificationResponseType.name,
        };
        pd(payload);

        onNotifications.add(jsonEncode(obj));
      },
    );
  }

  Future<List<PendingNotificationRequest>> pending() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return pendingNotificationRequests;
  }

  Future<void> show({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<void> setNotification() async {
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      '出勤時間がちかい',
      'スキャンを有効にしました',
      RepeatInterval.everyMinute,
      _platformChannelSpecifics,
      androidAllowWhileIdle: true,
      payload: '          HOOOOOOOOOOOOOOOOOOOO            ',
    );
  }

  Future<void> removeAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
