import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:habit/constant/size.dart';
import 'package:habit/constant/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:habit/provider/local_notification_provider.dart';
import 'package:habit/utilry/log/log.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  StreamSubscription<RangingResult>? _streamRanging;

  bool _isPaused = false;

  final bool isElevated = false;
  final bool isVisible = true;

  final _beacons = <Beacon>[];

  final _regionBeacons = <Region, List<Beacon>>{};

  late SharedPreferences _prefs;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    _prefs = await SharedPreferences.getInstance();

    await flutterBeacon.initializeScanning;

    startScanBeacon();
  }

  pauseScanBeacon() async {
    _streamRanging?.pause();

    setState(() => _isPaused = true);

    if (_beacons.isNotEmpty) {
      setState(() {
        _beacons.clear();
      });
    }
  }

  startScanBeacon() async {
    flutterBeacon.setBetweenScanPeriod(10000);
    // flutterBeacon.setScanPeriod(1000);

    final regions = <Region>[
      Region(identifier: 'com.beacon'),
    ];

    _streamRanging = flutterBeacon.ranging(regions).listen((RangingResult result) async {
      pd('---   ${DateTime.now()}   ---');
      if (mounted) {
        setState(() {
          _isPaused = _streamRanging?.isPaused ?? false;

          _regionBeacons[result.region] = result.beacons;
          _beacons.clear();
          for (var list in _regionBeacons.values) {
            _beacons.addAll(list);
          }
          _beacons.sort(_compareParameters);
        });

        for (var b in _beacons) {
          pd(b.proximity);
          if (b.proximity == Proximity.near) {
            ref.read(localNotificationControllerProvider.notifier);
          }
        }
      }
    });
  }

  int _compareParameters(Beacon a, Beacon b) {
    int compare = a.proximityUUID.compareTo(b.proximityUUID);

    if (compare == 0) {
      compare = a.major.compareTo(b.major);
    }

    if (compare == 0) {
      compare = a.minor.compareTo(b.minor);
    }

    return compare;
  }

  @override
  void dispose() {
    _streamRanging?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(localNotificationControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.broadcast_on_personal_outlined),
            onPressed: () => context.goNamed('broadcasting'),
          ),
          // IconButton(
          //   icon: const Icon(Icons.settings),
          //   onPressed: () => context.goNamed('setting'),
          // ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(S2),
              padding: const EdgeInsets.all(S2),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: RADIUS_ALL_M,
                color: Colors.black,
              ),
              child: _isPaused == false
                  ? _beacons.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GAP3,
                            Text(
                              _beacons[0].proximityUUID,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            GAP4,
                            Text(
                              'Major: ${_beacons[0].major}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Minor: ${_beacons[0].minor}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Accuracy: ${_beacons[0].accuracy}m',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'RSSI: ${_beacons[0].rssi}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Proximity: ${_beacons[0].proximity.name}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Tx power: ${_beacons[0].txPower}',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        )
                  : const Center(
                      child: Text('STOP NOW'),
                    ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              // color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(S3, S0, S1, S1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Scan',
                                        style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_horiz),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '10000ms',
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                      Switch(
                                        value: true,
                                        onChanged: (e) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(S3, S0, S1, S1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Notification',
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_horiz),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Switch(
                                        value: true,
                                        onChanged: (e) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(S3, S2, S1, S0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Action 1',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Switch(
                                      value: true,
                                      onChanged: (e) {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
          // elevation: isVisible ? 0.0 : null,
          onPressed: () async => !_isPaused ? pauseScanBeacon() : startScanBeacon(),
          child: Icon(!_isPaused ? Icons.stop : Icons.power_settings_new),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isVisible ? 80.0 : 0,
        child: BottomAppBar(
          elevation: isElevated ? null : 0.0,
          child: Row(
            children: [
              IconButton(
                tooltip: 'Open popup menu',
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  final SnackBar snackBar = SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
