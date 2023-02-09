import 'package:habit/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/firebase_options.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // if you want to manage manual checking about the required permissions
  await flutterBeacon.initializeScanning;

  // or if you want to include automatic checking permission
  await flutterBeacon.initializeAndCheckScanning;

  runApp(const ProviderScope(child: App()));
}
