import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_demo/list/comments.dart';
import 'package:persistent_bottom_nav_demo/list/details.dart';
import 'package:persistent_bottom_nav_demo/settings/settings.dart';

import 'home.dart';
import 'list/list_of_items.dart';
import 'notifications/notifications.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/list',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  observers: [
    GoRouterObserver(),
  ],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        log("child is $child  ");
        return Home(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/list',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const NewLists(),
            );
          },
          routes: [
            GoRoute(
              path: 'comments',
              builder: (context, state) {
                return const Comments();
              },
            ),
            GoRoute(
              path: 'details',
              builder: (context, state) {
                return const Details();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/notifications',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const Notifications(),
            );
          },
          routes: [],
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const Settings(),
            );
          },
          routes: [],
        ),
      ],
    ),
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) {
    //     return const MainScreen();
    //   },
    // ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPush ${route.settings.name} previousRoute ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('didPop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('didRemove');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('didReplace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
