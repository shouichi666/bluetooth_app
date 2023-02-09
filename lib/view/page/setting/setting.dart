import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/provider/auth_provider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        actions: [
          IconButton(
            onPressed: ref.read(authControllerProvider.notifier).signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.settings_remote_sharp),
            ),
            title: Text('ビーコンの発信間隔の設定'),
          )
        ],
      ),
    );
  }
}
