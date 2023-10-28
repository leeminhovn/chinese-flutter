import 'package:MochiChinese/config/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/modules/splase/splase.dart';

final GoRouter routerConfig =
    GoRouter(initialLocation: ApplicationRouteName.splash, routes: <RouteBase>[
  GoRoute(
      path: ApplicationRouteName.splash,
      name: ApplicationRouteName.splash,
      builder: (BuildContext context, GoRouterState state) => const Splase())
]);
