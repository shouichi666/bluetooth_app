import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:habit/provider/beacon_provider.dart';
import 'package:habit/provider/interval_provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import 'package:habit/constant/size.dart';
import 'package:habit/constant/style.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // late SharedPreferences _prefs;

  // @override
  // void dispose() {
  //   _streamRanging?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final scanBeacon = ref.watch(beaconControllerProvider.select((e) => e.scanBeacon));

    final baeconAction = ref.read(beaconControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HoGEe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.broadcast_on_personal_outlined),
          //   onPressed: () => context.goNamed('broadcasting'),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.settings),
          //   onPressed: () => context.goNamed('setting'),
          // ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // flutterBeacon.stopBroadcast();
              // _streamRanging?.cancel();

              flutterBeacon.close;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(S2),
              padding: const EdgeInsets.all(S3),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: RADIUS_ALL_M,
                color: Colors.black,
              ),
              child: ref.watch(beaconControllerProvider.select((e) => e.isScaning))
                  ? scanBeacon.uuid.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Stack(
                          fit: StackFit.passthrough,
                          alignment: Alignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              scanBeacon.uuid,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(
                                      trackWidth: 1,
                                      progressBarWidth: 18,
                                      shadowWidth: 60,
                                    ),
                                    startAngle: 180,
                                    angleRange: 240,
                                    infoProperties: InfoProperties(
                                      topLabelText: scanBeacon.proximity,
                                      topLabelStyle: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w100,
                                      ),
                                      mainLabelStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w100,
                                      ),
                                      modifier: (double value) {
                                        final volume = value.toInt();
                                        return '- $volume dBm';
                                      },
                                      bottomLabelStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                      ),
                                      bottomLabelText: 'RSSI',
                                    ),
                                    size: 180.0,
                                    counterClockwise: true,
                                    animDurationMultiplier: .9,
                                  ),
                                  initialValue: scanBeacon.rssi.toDouble() < 0
                                      ? scanBeacon.rssi.toDouble() * -1
                                      : scanBeacon.rssi.toDouble() * 1,
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: S1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Major : ${scanBeacon.major}',
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    Text(
                                      'Minor : ${scanBeacon.minor}',
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    Text(
                                      'Accuracy : ${scanBeacon.accuracy}m',
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                  : const Center(
                      child: Text('STOP NOW'),
                    ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: baeconAction.handleScan,
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
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          clipBehavior: Clip.antiAlias,
                                          shape: SHERPE_TOP,
                                          constraints: BoxConstraints(
                                            maxHeight:
                                                MediaQuery.of(context).size.height * 0.5,
                                          ),
                                          builder: ((context) {
                                            return const SelectTime();
                                          }),
                                        );
                                      },
                                      icon: const Icon(Icons.more_horiz),
                                    )
                                  ],
                                ),
                                GAP2,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ref.watch(intervalControllerProvider
                                          .select((e) => e.label)),
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    Switch(
                                      value: ref.watch(beaconControllerProvider
                                          .select((e) => e.isScaning)),
                                      onChanged: baeconAction.toggleSwitchScan,
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
                                GAP2,
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
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          // onTap: baeconAction.toggleScan,
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
                                      'Broadcast',
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          // isScrollControlled: true,
                                          clipBehavior: Clip.antiAlias,
                                          shape: SHERPE_TOP,
                                          // constraints: BoxConstraints(
                                          //   maxHeight:
                                          //       MediaQuery.of(context).size.height * 0.5,
                                          // ),
                                          builder: ((context) {
                                            return const SelectBroadCast();
                                          }),
                                        );
                                      },
                                      icon: const Icon(Icons.more_horiz),
                                    )
                                  ],
                                ),
                                GAP2,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ref.watch(beaconControllerProvider
                                              .select((e) => e.isBroadcasting))
                                          ? 'active'
                                          : 'inactive',
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    Switch(
                                      value: ref.watch(beaconControllerProvider
                                          .select((e) => e.isBroadcasting)),
                                      onChanged: (e) async => ref
                                          .read(beaconControllerProvider.notifier)
                                          .handleToggleBroadcast(context),
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
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(S3, S5, S1, S5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Task',
                                style: Theme.of(context).textTheme.titleMedium,
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
          // elevation: isVisible ? 0.0 : null,
          onPressed: baeconAction.handleScan,
          child: Icon(
            ref.watch(beaconControllerProvider.select((e) => e.isScaning))
                ? Icons.stop
                : Icons.power_settings_new,
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // height: isVisible ? 80.0 : 0,
        child: BottomAppBar(
          // elevation: isElevated ? null : 0.0,
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

class SelectTime extends ConsumerWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Scan Interval'),
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  ref.watch(intervalControllerProvider.select((e) => e.label)),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Expanded(
                flex: 1,
                child: SfSlider(
                    min: 1.0,
                    max: 100.0,
                    value: ref.watch(intervalControllerProvider.select((e) => e.value)),
                    interval: 1,
                    // showTicks: true,
                    // showLabels: true,
                    // enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) => ref
                        .read(intervalControllerProvider.notifier)
                        .onChangeValue(double.parse(value.toString()))

                    // body: Row(
                    //   children: [
                    //     Expanded(
                    //       child: DrumRoll(
                    //         scrollController: ctlr.hourScrollController,
                    //         list: hourList,
                    //         currnt: ref.watch(timerControllerProvider.select((e) => e.hour)),
                    //         onChanged: ctlr.onChangeHour,
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: DrumRoll(
                    //         scrollController: ctlr.minScrollController,
                    //         list: minList,
                    //         currnt: ref.watch(timerControllerProvider.select((e) => e.min)),
                    //         onChanged: ctlr.onChangeMinute,
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: DrumRoll(
                    //         scrollController: ctlr.secScrollController,
                    //         list: secList,
                    //         currnt: ref.watch(timerControllerProvider.select((e) => e.sec)),
                    //         onChanged: ctlr.onChangeSeconds,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class SelectBroadCast extends ConsumerWidget {
  const SelectBroadCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Broadcast contoller'),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () async => ref
                  .read(beaconControllerProvider.notifier)
                  .handleToggleBroadcast(context),
              leading: const Icon(Icons.wifi_tethering),
              title: const Text('Broadcast on/off'),
              trailing: Switch(
                value:
                    ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting)),
                onChanged: (e) async => ref
                    .read(beaconControllerProvider.notifier)
                    .handleToggleBroadcast(context),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Register/Setup'),
              onTap: () => context.goNamed('broadcasting'),
            ),
            const ListTile(
              leading: Icon(Icons.qr_code_2_outlined),
              title: Text('QRcode UUID'),
            ),
          ],
        ));
  }
}

class DrumRoll extends StatelessWidget {
  const DrumRoll({
    super.key,
    required this.scrollController,
    required this.list,
    required this.currnt,
    required this.onChanged,
  });

  final ScrollController scrollController;
  final List<String> list;
  final String currnt;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollnotification) {
        return true;
      },
      child: ListWheelScrollView(
        controller: scrollController,
        physics: const FixedExtentScrollPhysics(),
        itemExtent: 96,
        diameterRatio: .61,
        onSelectedItemChanged: onChanged,
        children: list.map((String selectItem) {
          return Center(
            child: Text(
              selectItem,
              style: selectItem == currnt
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w600)
                  : Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.blueGrey.shade300),
            ),
          );
        }).toList(),
      ),
    );
  }
}
