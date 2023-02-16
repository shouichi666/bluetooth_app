// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/model/beacon/beacon.dart';
import 'package:habit/provider/common_provider.dart';
import 'package:habit/provider/interval_provider.dart';
import 'package:habit/provider/local_notification_provider.dart';
import 'package:habit/provider/user_provider.dart';
import 'package:habit/repository/store_reposiotory.dart';
import 'package:habit/utilry/log/log.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

final beaconControllerProvider =
    StateNotifierProvider<BeaconController, BeaconState>((ref) {
  return BeaconController(ref);
});

class BeaconController extends StateNotifier<BeaconState> {
  BeaconController(this._ref) : super(const BeaconState()) {
    _init();
  }

  final Ref _ref;

  StreamSubscription<RangingResult>? _streamRanging;

  _init() async {
    if (mounted && await permissin()) {
      final fetch = await Future.wait([
        _ref.read(storeRepositoryProvider).relativeScan(),
        _ref.read(storeRepositoryProvider).relativeBroadcast(),
        _ref.read(storeRepositoryProvider).relativeState(),
      ]);

      state = state.copyWith(
        scanBeacon: fetch[0],
        broadcasBeacon: fetch[1],
        isBroadcasting: fetch[2]['isBroadcasting'] as bool,
        isScaning: fetch[2]['isScaning'] as bool,
      );

      if (state.isScaning) {
        _startScan();
      } else {
        _stopScan();
      }
    }

    // _ref.listenSelf((previous, next) {
    //   final p = previous as BeaconState;
    //   final s = next as BeaconState;

    //   pd(p.scanBeacon);
    //   // pd(p.scanBeacon.proximity);

    //   if (s.isScaning &&
    //       // p.scanBeacon.proximity != s.scanBeacon.proximity &&
    //       s.scanBeacon.proximity == 'immediate') {
    //     _ref.read(localNotificationControllerProvider.notifier).show();
    //     // pe('show');
    //   }
    // });
  }

  Future<bool> permissin() async {
    final con1 = await flutterBeacon.initializeScanning;

    final con2 = await flutterBeacon.initializeAndCheckScanning;

    if (con1 && con2) {
      state = state.copyWith(isSomePermission: true);
      return true;
    } else {
      state = state.copyWith(isSomePermission: false);
      return false;
    }
  }

  openPermissinPage() {}

  toggleSwitchScan(bool e) async {
    if (!e) {
      await _stopScan();
    } else {
      await _startScan();
    }

    await _ref.read(storeRepositoryProvider).postState(state);
  }

  handleScanBeacon() async {
    if (state.isScaning) {
      await _stopScan();
    } else {
      await _startScan();
    }

    await _ref.read(storeRepositoryProvider).postState(state);
  }

  handleScanCommit(BuildContext context, ScanBeacon beacon) async {
    await _ref.read(storeRepositoryProvider).postScanBeacon(beacon);
    pd('debugText');
    state = state.copyWith(scanBeacon: beacon);

    if (mounted) {
      Navigator.of(context).pop();

      context.go('/');
    }
  }

  hendleBroadcastCommit(BuildContext context) async {
    if (state.isBroadcasting) {
      await flutterBeacon.stopBroadcast();
    } else {
      final newState = BroadcastBeacon(
        uuid: _ref.read(uuidTextProvider).text,
        major: int.tryParse(_ref.read(majorTextProvider).text) ?? 0,
        minor: int.tryParse(_ref.read(minorTextProvider).text) ?? 0,
      );

      await _ref.read(storeRepositoryProvider).postBroadcast(newState);

      await flutterBeacon.startBroadcast(
        BeaconBroadcast(
          proximityUUID: newState.uuid,
          major: newState.major,
          minor: newState.minor,
        ),
      );

      state = state.copyWith(broadcasBeacon: newState);
    }

    if (mounted) {
      state = state.copyWith(isBroadcasting: await flutterBeacon.isBroadcasting());
    }

    if (mounted && state.isBroadcasting) {
      context.pop();
    }
  }

  handleToggleBroadcast(BuildContext context) async {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (state.broadcasBeacon.uuid.isEmpty) {
      final SnackBar snackBar = SnackBar(
        content: const Text('Please register first'),
        action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              context.goNamed('broadcasting');
              Navigator.of(context).pop();
            }),
      );

      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    state = state.copyWith(isBroadcasting: await flutterBeacon.isBroadcasting());

    if (state.isBroadcasting) {
      await flutterBeacon.stopBroadcast();
    } else {
      await flutterBeacon.startBroadcast(
        BeaconBroadcast(
          proximityUUID: state.broadcasBeacon.uuid,
          major: state.broadcasBeacon.major,
          minor: state.broadcasBeacon.minor,
        ),
      );
    }

    await _ref.read(storeRepositoryProvider).postState(state);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Broadcast ${state.isBroadcasting ? 'active' : 'inactive'}'),
      ));
    }
  }

  _startScan() async {
    final List<Region> r = [
      Region(identifier: 'com.baecon'),
    ];

    final interval = _ref.read(intervalControllerProvider.select((e) => e.value));

    await flutterBeacon.setBetweenScanPeriod(interval.toInt());

    state = state.copyWith(isScaning: true);

    _streamRanging = flutterBeacon.ranging(r).listen((e) {
      // pd(e);

      state = state.copyWith(
        scanList: e.beacons.isEmpty
            ? []
            : e.beacons
                .map(
                  (s) => ScanBeacon(
                    uuid: s.proximityUUID,
                    major: s.major,
                    minor: s.minor,
                    rssi: s.rssi,
                    accuracy: s.accuracy,
                    proximity: s.proximity.name,
                  ),
                )
                .toList(),
      );

      if (e.beacons.isNotEmpty) {
        for (Beacon b in e.beacons) {
          // pd(b);
          if (state.scanBeacon.uuid == b.proximityUUID) {
            final isSameProximity = state.scanBeacon.proximity == b.proximity.name;
            state = state.copyWith(
              scanBeacon: ScanBeacon(
                uuid: b.proximityUUID,
                major: b.major,
                minor: b.minor,
                rssi: b.rssi,
                accuracy: b.accuracy,
                proximity:
                    isSameProximity ? state.scanBeacon.proximity : b.proximity.name,
              ),
              isScanLoading: false,
            );
          }
        }
      } else {
        state = state.copyWith(isScanLoading: true);
      }
    });
  }

  _stopScan() {
    _streamRanging?.pause();

    state = state.copyWith(
      isScaning: false,
      scanList: [],
    );
  }
}
