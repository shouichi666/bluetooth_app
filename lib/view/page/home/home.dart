import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:habit/provider/auth_provider.dart';
import 'package:habit/provider/local_notification_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ref.read(localNotificationControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: ref.read(authControllerProvider.notifier).signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.airplanemode_active_sharp),
            ),
            title: const Text('出勤アクション'),
            onTap: () => context.goNamed(
              'action',
              params: {'id': 'case action'},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

const sample = [
  '1111111111111111111111111111111111',
  '2222222222222222222222222222222222',
  '3333333333333333333333333333333333',
  '4444444444444444444444444444444444',
  '5555555555555555555555555555555555',
  '6666666666666666666666666666666666',
];
