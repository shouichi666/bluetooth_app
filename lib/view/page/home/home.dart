import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:habit/provider/auth_provider.dart';
import 'package:habit/provider/task_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:habit/provider/beacon_provider.dart';
import 'package:habit/provider/interval_provider.dart';
import 'package:habit/provider/local_notification_provider.dart';
import 'package:habit/view/component/card.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:habit/constant/size.dart';
import 'package:habit/constant/style.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanBeacon = ref.watch(beaconControllerProvider.select((e) => e.scanBeacon));

    final baeconAction = ref.read(beaconControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HoGee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.goNamed('register'),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.goNamed('scan_list'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(S2),
        child: Column(
          children: [
            Card(
              shape: SHERPE_ALL,
              color: Colors.black,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(S3),
                child: ref.watch(beaconControllerProvider.select((e) => e.isScaning))
                    ? Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Row(
                              children: [
                                Text(
                                  scanBeacon.uuid,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: S4),
                            width: 210,
                            height: 210,
                            child: ref.watch(beaconControllerProvider
                                    .select((e) => e.isScanLoading))
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SleekCircularSlider(
                                    initialValue: scanBeacon.rssi.toDouble() *
                                        (scanBeacon.rssi.toDouble() < 0 ? -1 : 1),
                                    appearance: CircularSliderAppearance(
                                      counterClockwise: true,
                                      animationEnabled: false,
                                      startAngle: 180,
                                      angleRange: 240,
                                      animDurationMultiplier: .9,
                                      customWidths: CustomSliderWidths(
                                        trackWidth: 1,
                                        progressBarWidth: 14,
                                        shadowWidth: 58,
                                      ),
                                      infoProperties: InfoProperties(
                                        topLabelText: scanBeacon.proximity,
                                        modifier: (value) => '- ${value.toInt()} dBm',
                                        bottomLabelText: 'RSSI',
                                        topLabelStyle: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w100,
                                        ),
                                        mainLabelStyle: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w100,
                                        ),
                                        bottomLabelStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                  ),
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
                        child: Text('STOP'),
                      ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    ActionCard(
                      icon: const Icon(
                        Icons.settings_remote_sharp,
                        // color: Colors.purpleAccent,
                      ),
                      label: 'Scan',
                      content: '',
                      value:
                          ref.watch(beaconControllerProvider.select((e) => e.isScaning)),
                      onTap: baeconAction.handleScanBeacon,
                      onChanged: (e) => baeconAction.toggleSwitchScan(e),
                      moreAction: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          clipBehavior: Clip.antiAlias,
                          shape: SHERPE_TOP,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.5,
                          ),
                          builder: ((context) {
                            return const SelectTime();
                          }),
                        );
                      },
                    ),
                    ActionCard(
                      icon: const Icon(
                        Icons.broadcast_on_personal,
                        // color: Colors.lightBlue,
                      ),
                      label: 'Broadcast',
                      content: ref.watch(
                              beaconControllerProvider.select((e) => e.isBroadcasting))
                          ? ''
                          : '',
                      value: ref.watch(
                          beaconControllerProvider.select((e) => e.isBroadcasting)),
                      onChanged: (e) async => ref
                          .read(beaconControllerProvider.notifier)
                          .handleToggleBroadcast(context),
                      onTap: () async => ref
                          .read(beaconControllerProvider.notifier)
                          .handleToggleBroadcast(context),
                      moreAction: () {
                        showModalBottomSheet(
                          context: context,
                          clipBehavior: Clip.antiAlias,
                          shape: SHERPE_TOP,
                          builder: ((context) {
                            return const SelectBroadCast();
                          }),
                        );
                      },
                    ),
                  ],
                ),
                GAP3,
                const Tasks(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: baeconAction.handleScanBeacon,
        child: Icon(
          ref.watch(beaconControllerProvider.select((e) => e.isScaning))
              ? Icons.stop
              : Icons.power_settings_new,
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
                onPressed: ref.read(authControllerProvider.notifier).signOut,
                icon: const Icon(Icons.logout),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  ref.read(localNotificationControllerProvider.notifier).set();

                  final SnackBar snackBar = SnackBar(
                    content: const Text('Yay! set notification!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop_screen_share_sharp),
                onPressed: () {
                  ref.read(localNotificationControllerProvider.notifier).set();

                  final SnackBar snackBar = SnackBar(
                    content: const Text('Yay! set notification!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );

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
          actions: [
            Switch(
              value: ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting)),
              onChanged: (e) async => ref
                  .read(beaconControllerProvider.notifier)
                  .handleToggleBroadcast(context),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (ref.watch(
                          beaconControllerProvider.select((e) => e.isBroadcasting)))
                        const Icon(Icons.wifi_tethering, size: 80)
                      else
                        const Icon(Icons.wifi_tethering_off, size: 80),
                      GAP3,
                      Text(
                        ref.watch(beaconControllerProvider
                            .select((e) => e.broadcasBeacon.uuid)),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Register/Setup'),
                        onTap: () => context.goNamed('broadcasting'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const Icon(Icons.qr_code_2),
                        title: const Text('QRcode'),
                        onTap: () => context.goNamed('qr_view'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Tasks extends ConsumerWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(taskControllerProvider).when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
          data: (data) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: S2),
                  child: Row(
                    children: const [
                      Text('Tasks'),
                    ],
                  ),
                ),
                for (var task in data)
                  Row(
                    children: [
                      ActionCard(
                        icon: const Icon(Icons.task_alt_rounded),
                        label: 'Task 0${task.id}  -  ${task.runAt?.toString()}',
                        content: task.label,
                        // value: task.updateAt!.isAfter(
                        //   DateTime.parse("2023-02-13 12:30:00"),
                        // ),
                        value: task.runAt?.isBefore(DateTime.now()) ?? false,
                        onChanged: (e) {},
                        onTap: () async =>
                            await ref.read(taskControllerProvider.notifier).runTask(task),
                        moreAction: () {},
                      ),
                    ],
                  ),
              ],
            );
          },
        );
  }
}

class Hoge extends ConsumerWidget {
  const Hoge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(taskControllerProvider).when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
          data: (data) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: S2),
                  child: Row(
                    children: const [
                      Text('Tasks'),
                    ],
                  ),
                ),
                for (var task in data)
                  Row(
                    children: [
                      ActionCard(
                        icon: const Icon(Icons.task_alt_rounded),
                        label: 'Task 0${task.id}  -  ${task.runAt!.toString()}',
                        content: task.label,
                        // value: task.updateAt!.isAfter(
                        //   DateTime.parse("2023-02-13 12:30:00"),
                        // ),
                        value: task.runAt!.isBefore(DateTime.now()),
                        onChanged: (e) {},
                        onTap: () async =>
                            await ref.read(taskControllerProvider.notifier).runTask(task),
                        moreAction: () {},
                      ),
                    ],
                  ),
              ],
            );
          },
        );
  }
}
