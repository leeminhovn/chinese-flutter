import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/src/components/oragnisms/wrap_page.dart';
import 'package:MochiChinese/src/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/modules/splase/splase.dart';

final GoRouter routerConfig =
    GoRouter(initialLocation: ApplicationRouteName.home, routes: <RouteBase>[
  GoRoute(
      path: ApplicationRouteName.splash,
      name: ApplicationRouteName.splash,
      builder: (BuildContext context, GoRouterState state) => const Splase()),
  GoRoute(
      path: ApplicationRouteName.home,
      name: ApplicationRouteName.home,
      builder: (BuildContext context, GoRouterState state) =>
          const WrapPage(Home()))
]);
