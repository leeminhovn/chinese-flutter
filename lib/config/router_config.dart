import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/src/components/oragnisms/wrap_page.dart';
import 'package:MochiChinese/src/constant/app_constants.dart';
import 'package:MochiChinese/src/modules/home/home.dart';
import 'package:MochiChinese/src/modules/learn/learn.dart';
import 'package:MochiChinese/src/modules/learn/screens/list_course.dart';
import 'package:MochiChinese/src/modules/login/login.dart';
import 'package:MochiChinese/src/modules/notebook/notebook.dart';
import 'package:MochiChinese/src/modules/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/modules/signup/signup.dart';
import '../src/modules/splase/splase.dart';

final rootKey = AppConstants.rootKeyRoute;
final GoRouter routerConfig = GoRouter(
    initialLocation: ApplicationRouteName.splash,
    navigatorKey: rootKey,
    routes: <RouteBase>[
      GoRoute(
          path: ApplicationRouteName.splash,
          name: ApplicationRouteName.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const Splase()),
      GoRoute(
          path: ApplicationRouteName.profile,
          name: ApplicationRouteName.profile,
          parentNavigatorKey: rootKey,
          builder: (BuildContext context, GoRouterState state) {
            Map argument = state.extra == null ? {} : state.extra as Map;

            return Profile(
              redirectFrom: argument["redirectFrom"] ?? "",
            );
          }),
      GoRoute(
          path: ApplicationRouteName.list_course,
          name: ApplicationRouteName.list_course,
          builder: (BuildContext context, GoRouterState state) {
            return ListCourse();
          }),
      GoRoute(
          path: ApplicationRouteName.login,
          name: ApplicationRouteName.login,
          parentNavigatorKey: rootKey,
          builder: (BuildContext context, GoRouterState state) {
            Map argument = state.extra == null ? {} : state.extra as Map;

            return Login(
              backPage: argument["redirectFrom"] ?? "",
            );
          }),
      GoRoute(
          path: ApplicationRouteName.signup,
          name: ApplicationRouteName.signup,
          parentNavigatorKey: rootKey,
          builder: (BuildContext context, GoRouterState state) {
            Map argument = state.extra == null ? {} : state.extra as Map;
            print(argument["redirectFrom"] ?? "");

            return Signup(
              backPage: argument["redirectFrom"] ?? "",
            );
          }),
      StatefulShellRoute.indexedStack(
          branches: <StatefulShellBranch>[
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                  path: ApplicationRouteName.home,
                  name: ApplicationRouteName.home,
                  builder: (BuildContext context, GoRouterState state) =>
                      const Home()),
            ]),
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                  path: ApplicationRouteName.learn,
                  name: ApplicationRouteName.learn,
                  builder: (BuildContext context, GoRouterState state) {
                    Map argument =
                        state.extra == null ? {} : state.extra as Map;

                    return Learn(infoPopupShow: argument["popupShow"] ?? "");
                  }),
            ]),
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                  path: ApplicationRouteName.notebook,
                  name: ApplicationRouteName.notebook,
                  builder: (BuildContext context, GoRouterState state) =>
                      Notebook())
            ]),
          ],
          builder: (context, state, navigationShell) {
            return WrapPage(navigationShell);
          }),

      // ShellRoute(
      //     navigatorKey: _shellNavigatorKey,
      //     routes: [
      //       GoRoute(
      //           path: ApplicationRouteName.home,
      //           name: ApplicationRouteName.home,
      //           pageBuilder: (context, state) => CustomTransitionPage<void>(
      //               key: state.pageKey,
      //               child: const Home(),
      //               transitionsBuilder:
      //                   (context, animation, secondaryAnimation, child) => child),
      //           builder: (BuildContext context, GoRouterState state) =>
      //               const Home()),
      //       GoRoute(
      //           path: ApplicationRouteName.learn,
      //           name: ApplicationRouteName.learn,
      //           pageBuilder: (context, state) => CustomTransitionPage<void>(
      //               key: state.pageKey,
      //               child: Learn(),
      //               transitionsBuilder:
      //                   (context, animation, secondaryAnimation, child) => child),
      //           builder: (BuildContext context, GoRouterState state) => Learn()),
      //       GoRoute(
      //           path: ApplicationRouteName.notebook,
      //           name: ApplicationRouteName.notebook,
      //           pageBuilder: (context, state) => CustomTransitionPage<void>(
      //               key: state.pageKey,
      //               child: Notebook(),
      //               transitionsBuilder:
      //                   (context, animation, secondaryAnimation, child) => child),
      //           builder: (BuildContext context, GoRouterState state) => Notebook())
      //     ],
      //     builder: (context, state, child) {
      //       return WrapPage(child);
      //     })
    ]);
