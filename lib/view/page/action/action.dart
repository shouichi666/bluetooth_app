import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/provider/local_notification_provider.dart';

class ActionDetailPage extends ConsumerWidget {
  const ActionDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.wifi),
            ),
            title: Text('このWIFIに接続時に何をするのかアクション設定'),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.remove),
            ),
            title: const Text('アクションをリセット'),
            onTap: ref.read(localNotificationControllerProvider.notifier).removeAll,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(localNotificationControllerProvider.notifier).set,
        child: const Icon(Icons.add),
      ),
    );
  }
}
