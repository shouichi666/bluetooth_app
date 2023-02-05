import 'dart:async';

import 'package:habit/utilry/log/log.dart';
import 'package:habit/view/page/action/action.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:habit/provider/auth_provider.dart';
import 'package:habit/view/page/home/home.dart';
import 'package:habit/view/page/launch/launch.dart';

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

    pd(loginState);

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
