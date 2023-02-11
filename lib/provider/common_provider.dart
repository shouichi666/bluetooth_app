import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/repository/auth_reposiotory.dart';
import 'package:habit/repository/store_reposiotory.dart';
import 'package:uuid/uuid.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref));

final uuidTextProvider = Provider.autoDispose((ref) {
  final contoller = TextEditingController(text: const Uuid().v4().toUpperCase());

  ref.onDispose(() => contoller.dispose());

  return contoller;
});

final majorTextProvider = Provider.autoDispose((ref) {
  final contoller = TextEditingController(text: '0');

  ref.onDispose(() => contoller.dispose());

  return contoller;
});

final minorTextProvider = Provider.autoDispose((ref) {
  final contoller = TextEditingController(text: '0');

  ref.onDispose(() => contoller.dispose());

  return contoller;
});

final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  final uid = ref.read(firebaseAuthProvider).currentUser?.uid ?? '';

  return StoreRepository(ref, uid);
});
