import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeProvider = Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

// final storeRepositoryProvider = Provider<StoreRepository>((ref) => StoreRepository(ref));
