import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/provider/beacon_provider.dart';
import 'package:habit/provider/common_provider.dart';

class TabBroadcasting extends ConsumerStatefulWidget {
  const TabBroadcasting({super.key});
  @override
  ConsumerState<TabBroadcasting> createState() => _TabBroadcastingState();
}

class _TabBroadcastingState extends ConsumerState<TabBroadcasting> {
  final clearFocus = FocusNode();

  @override
  void dispose() {
    clearFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register/Setup'),
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
        onPressed: () async => await ref
            .read(beaconControllerProvider.notifier)
            .hendleBroadcastCommit(context),
        icon: Icon(
          ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting))
              ? Icons.stop_circle_rounded
              : Icons.broadcast_on_personal,
        ),
        label: Text(ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting))
            ? 'Stop'
            : 'Broadcast'),
      ),
    );
  }

  Widget get uuidField {
    return TextFormField(
      autofocus: true,
      readOnly: ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting)),
      controller: ref.watch(uuidTextProvider),
      decoration: const InputDecoration(
        labelText: 'Proximity UUID',
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Proximity UUID required';
        }

        final regexUUID = RegExp(
            r'[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}');

        if (!regexUUID.hasMatch(val)) {
          return 'Invalid Proxmity UUID format';
        }

        return null;
      },
    );
  }

  Widget get majorField {
    return TextFormField(
      readOnly: ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting)),
      controller: ref.watch(majorTextProvider),
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
      readOnly: ref.watch(beaconControllerProvider.select((e) => e.isBroadcasting)),
      controller: ref.watch(minorTextProvider),
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
