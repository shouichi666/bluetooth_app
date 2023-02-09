import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

class TabBroadcasting extends StatefulWidget {
  const TabBroadcasting({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBroadcastingState createState() => _TabBroadcastingState();
}

class _TabBroadcastingState extends State<TabBroadcasting> {
  final clearFocus = FocusNode();
  bool broadcasting = false;

  final regexUUID = RegExp(
      r'[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}');
  final uuidController = TextEditingController(text: '');
  final majorController = TextEditingController(text: '0');
  final minorController = TextEditingController(text: '0');

  var uuid = const Uuid();

  @override
  void initState() {
    initBroadcastBeacon();

    uuidController.text = uuid.v4();

    super.initState();
  }

  initBroadcastBeacon() async {
    await flutterBeacon.initializeScanning;
  }

  @override
  void dispose() {
    clearFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Broadcast'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(clearFocus),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                uuidField,
                majorField,
                minorField,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (broadcasting) {
            await flutterBeacon.stopBroadcast();
          } else {
            await flutterBeacon.startBroadcast(
              BeaconBroadcast(
                // identifier: 'com.CB10023F-A318-3394-4199-A8730C7C1AEC',
                proximityUUID: uuidController.text,
                major: int.tryParse(majorController.text) ?? 0,
                minor: int.tryParse(minorController.text) ?? 0,
              ),
            );
          }

          final isBroadcasting = await flutterBeacon.isBroadcasting();

          if (mounted) {
            setState(() {
              broadcasting = isBroadcasting;
            });
          }
        },
        icon: Icon(
          broadcasting ? Icons.stop_circle_rounded : Icons.broadcast_on_personal,
        ),
        label: Text(broadcasting ? 'Stop' : 'Broadcast'),
      ),
    );
  }

  Widget get uuidField {
    return TextFormField(
      readOnly: broadcasting,
      controller: uuidController,
      decoration: const InputDecoration(
        labelText: 'Proximity UUID',
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Proximity UUID required';
        }

        if (!regexUUID.hasMatch(val)) {
          return 'Invalid Proxmity UUID format';
        }

        return null;
      },
    );
  }

  Widget get majorField {
    return TextFormField(
      readOnly: broadcasting,
      controller: majorController,
      decoration: const InputDecoration(
        labelText: 'Major',
      ),
      keyboardType: TextInputType.number,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Major required';
        }

        try {
          int major = int.parse(val);

          if (major < 0 || major > 65535) {
            return 'Major must be number between 0 and 65535';
          }
        } on FormatException {
          return 'Major must be number';
        }

        return null;
      },
    );
  }

  Widget get minorField {
    return TextFormField(
      readOnly: broadcasting,
      controller: minorController,
      decoration: const InputDecoration(
        labelText: 'Minor',
      ),
      keyboardType: TextInputType.number,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Minor required';
        }

        try {
          int minor = int.parse(val);

          if (minor < 0 || minor > 65535) {
            return 'Minor must be number between 0 and 65535';
          }
        } on FormatException {
          return 'Minor must be number';
        }

        return null;
      },
    );
  }
}
