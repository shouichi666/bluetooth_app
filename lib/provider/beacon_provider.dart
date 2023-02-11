// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/model/beacon/beacon.dart';
import 'package:habit/provider/common_provider.dart';
import 'package:habit/provider/interval_provider.dart';
import 'package:habit/provider/user_provider.dart';
import 'package:habit/repository/store_reposiotory.dart';
import 'package:habit/utilry/log/log.dart';

final fetchStoreProvider = FutureProvider.family<BeaconState, String>((ref, uid) async {
  final fetch = await Future.wait([
    ref.read(storeRepositoryProvider).relativeBroadcast(),
    ref.read(storeRepositoryProvider).relativeState(),
  ]);

  return BeaconState(
    broadcasBeacon: fetch[0],
    isBroadcasting: fetch[1].isBroadcasting,
    isSomePermission: fetch[1].isSomePermission,
    isScaning: fetch[1].isScaning,
  );
});

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
      getCurrentBeaconID();

      final fetch = await Future.wait([
        _ref.read(storeRepositoryProvider).relativeBroadcast(),
        _ref.read(storeRepositoryProvider).relativeState(),
      ]);

      pd(fetch);

      state = state.copyWith(
        broadcasBeacon: fetch[0],
        isBroadcasting: fetch[1]['isBroadcasting'] as bool,
        isScaning: fetch[1]['isScaning'] as bool,
      );
    }
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

  getCurrentBeaconID() async {
    // fetch scan data store

    state = state.copyWith(
      uuid: 'B7BD853E-BA39-4A04-A20E-9A61E162BB23',
      isBroadcasting: true,
    );
  }

  openPermissinPage() {}

  toggleSwitchScan(bool e) {
    pd(e);
    if (!e) {
      pd('debugText 2');
      _stopScan();
    } else {
      pd('debugText 1');
      _startScan();
    }
  }

  handleScan() {
    if (state.isScaning) {
      pd('debugText 2');
      _stopScan();
    } else {
      pd('debugText 1');
      _startScan();
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
      Region(identifier: 'com.beacon'),
    ];

    pd('start');

    final interval = _ref.read(intervalControllerProvider.select((e) => e.value));

    await flutterBeacon.setBetweenScanPeriod(interval.toInt());

    _streamRanging = flutterBeacon.ranging(r).listen((e) {
      state = state.copyWith(isScaning: true);

      pd(e);

      if (e.beacons.isNotEmpty) {
        for (Beacon b in e.beacons) {
          if (state.uuid == b.proximityUUID) {
            state = state.copyWith(
              scanBeacon: ScanBeacon(
                uuid: b.proximityUUID,
                major: b.major,
                minor: b.minor,
                rssi: b.rssi,
                accuracy: b.accuracy,
                proximity: b.proximity.name,
              ),
              isScaning: true,
            );
          }
        }
      }
    });
  }

  _stopScan() {
    _streamRanging?.pause();

    state = state.copyWith(isScaning: false);
  }
}
