import 'package:habit/provider/beacon_provider.dart';
import 'package:habit/provider/local_notification_provider.dart';
import 'package:habit/provider/task_provider.dart';
import 'package:habit/route/route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref.read(localNotificationControllerProvider);
    ref.read(taskControllerProvider);
    ref.read(beaconControllerProvider);

    return MaterialApp.router(
      title: 'Bluetooth App',
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blueGrey,
      ),
    );
  }
}
