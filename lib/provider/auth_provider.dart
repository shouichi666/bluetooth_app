import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit/repository/auth_reposiotory.dart';
import 'package:habit/utilry/log/log.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref));

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<User?> {
  AuthController(this._ref) : super(null) {
    pd('debugText');
    _ref.read(firebaseAuthProvider).userChanges().listen(_init);
  }

  final Ref _ref;

  @override
  User? get state => _ref.read(authRepositoryProvider).getCurrentUser();

  @override
  void dispose() {
    super.dispose();
  }

  _init(User? user) {
    state = user;
  }

  Future<void> signUp() async {
    await _ref.read(authRepositoryProvider).signUp();
    // Firestoreにユーザデータを追加したり
  }

  Future<void> signOut() async {
    await _ref.read(authRepositoryProvider).signOut();
  }
}
