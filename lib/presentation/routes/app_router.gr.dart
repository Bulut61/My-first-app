// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/src/widgets/framework.dart' as _i12;

import '../pages/calender_page.dart' as _i7;
import '../pages/fam_page.dart' as _i6;
import '../pages/home.dart' as _i2;
import '../pages/homepage.dart' as _i4;
import '../pages/score_page.dart' as _i9;
import '../pages/sign_in_page.dart' as _i1;
import '../pages/task_page.dart' as _i5;
import '../pages/tasks_bottom_page.dart' as _i8;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SignInPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignInPageRouteArgs>(
          orElse: () => const SignInPageRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignInPage(key: args.key),
      );
    },
    HRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
      );
    },
    MeRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    FamRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    CalRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    TasksRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    ScoreRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    HomepageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.Homepage(),
      );
    },
    TaskPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TaskPage(),
      );
    },
    FamPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FamPage(),
      );
    },
    CalenderPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CalenderPage(),
      );
    },
    TasksBottomPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.TasksBottomPage(),
      );
    },
    ScorePageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ScorePage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SignInPageRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          HRouter.name,
          path: 'home',
          children: [
            _i10.RouteConfig(
              MeRouter.name,
              path: 'me',
              parent: HRouter.name,
              children: [
                _i10.RouteConfig(
                  HomepageRoute.name,
                  path: '',
                  parent: MeRouter.name,
                ),
                _i10.RouteConfig(
                  TaskPageRoute.name,
                  path: 'createTask',
                  parent: MeRouter.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              FamRouter.name,
              path: 'fam',
              parent: HRouter.name,
              children: [
                _i10.RouteConfig(
                  FamPageRoute.name,
                  path: '',
                  parent: FamRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              CalRouter.name,
              path: 'cal',
              parent: HRouter.name,
              children: [
                _i10.RouteConfig(
                  CalenderPageRoute.name,
                  path: '',
                  parent: CalRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              TasksRouter.name,
              path: 'tasks',
              parent: HRouter.name,
              children: [
                _i10.RouteConfig(
                  TasksBottomPageRoute.name,
                  path: '',
                  parent: TasksRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              ScoreRouter.name,
              path: 'score',
              parent: HRouter.name,
              children: [
                _i10.RouteConfig(
                  ScorePageRoute.name,
                  path: '',
                  parent: ScoreRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SignInPage]
class SignInPageRoute extends _i10.PageRouteInfo<SignInPageRouteArgs> {
  SignInPageRoute({_i12.Key? key})
      : super(
          SignInPageRoute.name,
          path: '/',
          args: SignInPageRouteArgs(key: key),
        );

  static const String name = 'SignInPageRoute';
}

class SignInPageRouteArgs {
  const SignInPageRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignInPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.Home]
class HRouter extends _i10.PageRouteInfo<void> {
  const HRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class MeRouter extends _i10.PageRouteInfo<void> {
  const MeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          MeRouter.name,
          path: 'me',
          initialChildren: children,
        );

  static const String name = 'MeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class FamRouter extends _i10.PageRouteInfo<void> {
  const FamRouter({List<_i10.PageRouteInfo>? children})
      : super(
          FamRouter.name,
          path: 'fam',
          initialChildren: children,
        );

  static const String name = 'FamRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class CalRouter extends _i10.PageRouteInfo<void> {
  const CalRouter({List<_i10.PageRouteInfo>? children})
      : super(
          CalRouter.name,
          path: 'cal',
          initialChildren: children,
        );

  static const String name = 'CalRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class TasksRouter extends _i10.PageRouteInfo<void> {
  const TasksRouter({List<_i10.PageRouteInfo>? children})
      : super(
          TasksRouter.name,
          path: 'tasks',
          initialChildren: children,
        );

  static const String name = 'TasksRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ScoreRouter extends _i10.PageRouteInfo<void> {
  const ScoreRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ScoreRouter.name,
          path: 'score',
          initialChildren: children,
        );

  static const String name = 'ScoreRouter';
}

/// generated route for
/// [_i4.Homepage]
class HomepageRoute extends _i10.PageRouteInfo<void> {
  const HomepageRoute()
      : super(
          HomepageRoute.name,
          path: '',
        );

  static const String name = 'HomepageRoute';
}

/// generated route for
/// [_i5.TaskPage]
class TaskPageRoute extends _i10.PageRouteInfo<void> {
  const TaskPageRoute()
      : super(
          TaskPageRoute.name,
          path: 'createTask',
        );

  static const String name = 'TaskPageRoute';
}

/// generated route for
/// [_i6.FamPage]
class FamPageRoute extends _i10.PageRouteInfo<void> {
  const FamPageRoute()
      : super(
          FamPageRoute.name,
          path: '',
        );

  static const String name = 'FamPageRoute';
}

/// generated route for
/// [_i7.CalenderPage]
class CalenderPageRoute extends _i10.PageRouteInfo<void> {
  const CalenderPageRoute()
      : super(
          CalenderPageRoute.name,
          path: '',
        );

  static const String name = 'CalenderPageRoute';
}

/// generated route for
/// [_i8.TasksBottomPage]
class TasksBottomPageRoute extends _i10.PageRouteInfo<void> {
  const TasksBottomPageRoute()
      : super(
          TasksBottomPageRoute.name,
          path: '',
        );

  static const String name = 'TasksBottomPageRoute';
}

/// generated route for
/// [_i9.ScorePage]
class ScorePageRoute extends _i10.PageRouteInfo<void> {
  const ScorePageRoute()
      : super(
          ScorePageRoute.name,
          path: '',
        );

  static const String name = 'ScorePageRoute';
}
