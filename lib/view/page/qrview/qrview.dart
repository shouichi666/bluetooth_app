import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/provider/beacon_provider.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QrViewPage extends ConsumerWidget {
  const QrViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uuid = ref.read(beaconControllerProvider.select((e) => e.broadcasBeacon.uuid));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('QR code'),
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: uuid,
              version: QrVersions.auto,
              size: 200.0,
              eyeStyle: QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.blueGrey.shade200,
              ),
              dataModuleStyle: QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.circle,
                color: Colors.blueGrey.shade200,
              ),
            ),
            Text(uuid),
          ],
        ),
      ),
    );
  }
}
