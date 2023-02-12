import 'dart:async';

import 'package:habit/view/page/action/action.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:habit/provider/auth_provider.dart';
import 'package:habit/view/page/broadcast/broadcast.dart';
import 'package:habit/view/page/home/home.dart';
import 'package:habit/view/page/launch/launch.dart';
import 'package:habit/view/page/register/register.dart';
import 'package:habit/view/page/scan_list/scan_list.dart';
import 'package:habit/view/page/setting/setting.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = AsyncRouterNotifier(ref);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: router, // This notifiies `GoRouter` for refresh events
    redirect: router._redirect, // All the logic is centralized here
    routes: router._routes, // All the routes can be found there
  );
});

/// This approach is a copy of Router1, but allows for asynchronous redirects.
class AsyncRouterNotifier extends ChangeNotifier {
  final Ref _ref;

  AsyncRouterNotifier(this._ref) {
    _ref.listen<User?>(
      authControllerProvider,
      (_, __) => notifyListeners(),
    );
  }

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    final loginState = _ref.read(authControllerProvider);

    // pd(loginState);

    if (loginState == null) {
      if (state.location.contains('/launch')) {
        return null;
      }

      try {
        final currentUser = _ref.read(authControllerProvider);

        if (currentUser == null) return '/launch';

        return null;
      } catch (err) {
        return '/launch';
      }
    } else {
      if (state.location.contains('/launch')) {
        return '/';
      }
    }

    return null;
  }

  List<GoRoute> get _routes => [
        //launch
        GoRoute(
          path: '/',
          builder: (context, _) => const HomePage(),
          routes: <RouteBase>[
            GoRoute(
              path: 'broadcasting',
              name: 'broadcasting',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: TabBroadcasting(key: state.pageKey),
                );
              },
            ),
            GoRoute(
              path: 'register',
              name: 'register',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: RegisterPage(key: state.pageKey),
                );
              },
            ),
            GoRoute(
              path: 'scan_list',
              name: 'scan_list',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: ScanListPage(key: state.pageKey),
                );
              },
            ),
            GoRoute(
              path: 'setting',
              name: 'setting',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: SettingPage(key: state.pageKey),
                );
              },
            ),
            GoRoute(
              path: 'action/:id',
              name: 'action',
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: ActionDetailPage(
                    key: state.pageKey,
                    id: state.params['id']!,
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/launch',
          builder: (context, _) => const LaunchPage(),
          // routes: <RouteBase>[
          //  GoRoute(
          //    path: 'myaddress_edit/:address',
          //    builder: (context, _) => Myaddress(
          //      key: _.pageKey,
          //      address: _.params['address']!,
          //      name: _.queryParams['name']!,
          //    ),
          //  ),
          // ],
        ),
      ];
}
