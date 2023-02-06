import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit/provider/user_provider.dart';
import 'package:habit/utilry/log/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreRepository {
  const StoreRepository(this._ref, this._uid);

  final Ref _ref;
  final String _uid;

  login(User user) async {
    pd(user);
    if (_uid.isEmpty) return;
    pd(user);

    final exits = await _ref
        .read(storeProvider)
        .collection('user')
        .where('uid', isEqualTo: _uid)
        .get()
        .then((e) => 0 < e.size);

    pd(exits);

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
}
