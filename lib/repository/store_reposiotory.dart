import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit/model/beacon/beacon.dart';
import 'package:habit/provider/user_provider.dart';
import 'package:habit/utilry/log/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreRepository {
  const StoreRepository(this._ref, this._uid);

  final Ref _ref;
  final String _uid;

  DocumentReference<Map<String, dynamic>> get _udoc =>
      _ref.read(storeProvider).collection('user').doc(_uid);

  login(User user) async {
    if (_uid.isEmpty) return;
    // pd(user);

    final exits = await _ref
        .read(storeProvider)
        .collection('user')
        .where('uid', isEqualTo: _uid)
        .get()
        .then((e) => 0 < e.size);

    // pd(exits);

    if (!exits) {
      _ref.read(storeProvider).collection('user').doc(_uid).set(
        {
          'uid': user.uid,
          'name': user.displayName,
          'token': await user.getIdToken(),
        },
      );
    } else {
      _ref.read(storeProvider).collection('user').doc(_uid).update(
        {
          'uid': user.uid,
          'name': user.displayName,
          'token': await user.getIdToken(),
        },
      );
    }
  }

  Future<ScanBeacon> relativeScan() async {
    final scan = await _udoc.collection('scan').doc(_uid).get().then((e) => e.data());

    return ScanBeacon.fromJson(scan!);
  }

  Future<BroadcastBeacon> relativeBroadcast() async {
    final broadcast =
        await _udoc.collection('broadcast').doc(_uid).get().then((e) => e.data());

    return BroadcastBeacon.fromJson(broadcast!);
  }

  Future<dynamic> relativeState() async {
    final state = await _udoc.collection('state').doc(_uid).get().then((e) => e.data());

    if (state == null) {
      final newState = {
        'isBroadcasting': false,
        'isScaning': false,
      };
      await _udoc.collection('state').doc(_uid).set(newState);
      return newState;
    }

    return state;
  }

  postScanBeacon(ScanBeacon beacon) async {
    await _udoc.collection('scan').doc(_uid).set(beacon.toJson());
  }

  postBroadcast(BroadcastBeacon model) async {
    await _udoc.collection('broadcast').doc(_uid).set(model.toJson());
  }

  postState(BeaconState model) async {
    pd(model);

    await _udoc.collection('state').doc(_uid).set(
      {
        'isBroadcasting': model.isBroadcasting,
        'isScaning': model.isScaning,
        'isSomePermission': model.isSomePermission,
      },
    );
  }

  deleteBroadcast(String id) async {
    await _udoc.collection('broadcast').doc(id).delete();
  }
}
