import 'package:flutter/material.dart';

import 'package:habit/constant/size.dart';
import 'package:habit/constant/style.dart';
import 'package:habit/provider/beacon_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScanListPage extends HookConsumerWidget {
  const ScanListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanList = ref.watch(beaconControllerProvider.select((e) => e.scanList));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
        actions: [
          TextButton(
            onPressed: ref.read(beaconControllerProvider.notifier).handleScanBeacon,
            child: Text(
              ref.watch(beaconControllerProvider.select((e) => e.isScaning))
                  ? 'Stop'
                  : 'Scan',
            ),
          ),
        ],
      ),
      body: ref.watch(beaconControllerProvider.select((e) => e.isScaning))
          ? scanList.isNotEmpty
              ? ListView.builder(
                  itemCount: scanList.length,
                  itemBuilder: (context, index) {
                    final item = scanList[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.settings_remote_sharp),
                      ),
                      title: Text(item.uuid),
                      onTap: () {
                        final selectBeacon = item;

                        showModalBottomSheet(
                          context: context,
                          shape: SHERPE_TOP,
                          builder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.settings_remote_sharp, size: 80),
                                        GAP3,
                                        Text('UUID : ${selectBeacon.uuid}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: S3, horizontal: S4),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: FilledButton(
                                          onPressed: () async => await ref
                                              .read(beaconControllerProvider.notifier)
                                              .handleScanCommit(context, item),
                                          child: const Text('Save'),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )
          : const Center(
              child: Text('scan inactive'),
            ),
    );
  }
}
