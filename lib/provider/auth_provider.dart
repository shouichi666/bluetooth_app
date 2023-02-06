import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/repository/auth_reposiotory.dart';
import 'package:habit/repository/store_reposiotory.dart';
import 'package:habit/utilry/log/log.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref));

final authControllerProvider = StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController(ref);
});

class AuthController extends StateNotifier<User?> {
  AuthController(this._ref) : super(null) {
    _ref.read(firebaseAuthProvider).userChanges().listen(_init);
  }

  final Ref _ref;

  @override
  User? get state => _ref.read(authRepositoryProvider).getCurrentUser();

  _init(User? user) async {
    state = user;

    pd(user);

    if (state != null) {
      await StoreRepository(_ref, state!.uid).login(state!);
    }

    _ref.listenSelf((pre, next) async {
      if (pre == null && next != null) {
        pd(next);
        await StoreRepository(_ref, (next as User).uid).login(next);
      }
    });
  }

  Future<void> signUp() async {
    await _ref.read(authRepositoryProvider).signUp();
    // Firestoreにユーザデータを追加したり
  }

  Future<void> signOut() async {
    await _ref.read(authRepositoryProvider).signOut();
  }
}
