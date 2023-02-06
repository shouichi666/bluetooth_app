import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/provider/local_notification_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.timer),
            ),
            title: const Text('タイマーをセット'),
            onTap: ref.read(localNotificationControllerProvider.notifier).set,
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.open_in_browser),
            ),
            title: const Text('ブラウザー'),
            onTap: () async {
              final url = Uri.parse(
                  'https://pnt.tsukasa.cloud/user/comm/id/XEqIMK1mfQOKlYjocHoM2KKH7Tj2/?id=23');
              !await launchUrl(url);
            },
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
    );
  }
}
