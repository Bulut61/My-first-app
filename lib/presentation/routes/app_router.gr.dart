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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i17;

import '../pages/calender_page.dart' as _i13;
import '../pages/create%20Family%20pages/create_family_page.dart' as _i3;
import '../pages/fam_page.dart' as _i12;
import '../pages/home.dart' as _i4;
import '../pages/homePages/child_confirm_task_page.dart' as _i11;
import '../pages/homePages/confirm_task_page.dart' as _i9;
import '../pages/homePages/homepage.dart' as _i6;
import '../pages/homePages/pocket_money_page.dart' as _i10;
import '../pages/homePages/shopping_list_page.dart' as _i8;
import '../pages/homePages/task_page.dart' as _i7;
import '../pages/register_page.dart' as _i2;
import '../pages/score_page.dart' as _i15;
import '../pages/sign_in_page.dart' as _i1;
import '../pages/tasks_bottom_page.dart' as _i14;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SignInPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignInPageRouteArgs>(
          orElse: () => const SignInPageRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignInPage(key: args.key),
      );
    },
    RRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterPage(),
      );
    },
    JRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CreateFamilyPage(),
      );
    },
    HRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.Home(),
      );
    },
    MeRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    FamRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    CalRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    TasksRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    ScoreRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    HomepageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.Homepage(),
      );
    },
    TaskPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.TaskPage(),
      );
    },
    ShoppingListPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ShoppingListPage(),
      );
    },
    ConfirmTaskPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ConfirmTaskPage(),
      );
    },
    PocketMoneyPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.PocketMoneyPage(),
      );
    },
    ChildConfirmTaskPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ChildConfirmTaskPage(),
      );
    },
    FamPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.FamPage(),
      );
    },
    CalenderPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.CalenderPage(),
      );
    },
    TasksBottomPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.TasksBottomPage(),
      );
    },
    ScorePageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ScorePage(),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          SignInPageRoute.name,
          path: '/',
        ),
        _i16.RouteConfig(
          RRouter.name,
          path: 'register',
        ),
        _i16.RouteConfig(
          JRouter.name,
          path: 'join',
        ),
        _i16.RouteConfig(
          HRouter.name,
          path: 'home',
          children: [
            _i16.RouteConfig(
              MeRouter.name,
              path: 'me',
              parent: HRouter.name,
              children: [
                _i16.RouteConfig(
                  HomepageRoute.name,
                  path: '',
                  parent: MeRouter.name,
                ),
                _i16.RouteConfig(
                  TaskPageRoute.name,
                  path: 'createTask',
                  parent: MeRouter.name,
                ),
                _i16.RouteConfig(
                  ShoppingListPageRoute.name,
                  path: 'shoppingList',
                  parent: MeRouter.name,
                ),
                _i16.RouteConfig(
                  ConfirmTaskPageRoute.name,
                  path: 'ConfirmTask',
                  parent: MeRouter.name,
                ),
                _i16.RouteConfig(
                  PocketMoneyPageRoute.name,
                  path: 'PocketMoney',
                  parent: MeRouter.name,
                ),
                _i16.RouteConfig(
                  ChildConfirmTaskPageRoute.name,
                  path: 'CompletedTasks',
                  parent: MeRouter.name,
                ),
              ],
            ),
            _i16.RouteConfig(
              FamRouter.name,
              path: 'fam',
              parent: HRouter.name,
              children: [
                _i16.RouteConfig(
                  FamPageRoute.name,
                  path: '',
                  parent: FamRouter.name,
                )
              ],
            ),
            _i16.RouteConfig(
              CalRouter.name,
              path: 'cal',
              parent: HRouter.name,
              children: [
                _i16.RouteConfig(
                  CalenderPageRoute.name,
                  path: '',
                  parent: CalRouter.name,
                )
              ],
            ),
            _i16.RouteConfig(
              TasksRouter.name,
              path: 'tasks',
              parent: HRouter.name,
              children: [
                _i16.RouteConfig(
                  TasksBottomPageRoute.name,
                  path: '',
                  parent: TasksRouter.name,
                )
              ],
            ),
            _i16.RouteConfig(
              ScoreRouter.name,
              path: 'score',
              parent: HRouter.name,
              children: [
                _i16.RouteConfig(
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
class SignInPageRoute extends _i16.PageRouteInfo<SignInPageRouteArgs> {
  SignInPageRoute({_i17.Key? key})
      : super(
          SignInPageRoute.name,
          path: '/',
          args: SignInPageRouteArgs(key: key),
        );

  static const String name = 'SignInPageRoute';
}

class SignInPageRouteArgs {
  const SignInPageRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SignInPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RegisterPage]
class RRouter extends _i16.PageRouteInfo<void> {
  const RRouter()
      : super(
          RRouter.name,
          path: 'register',
        );

  static const String name = 'RRouter';
}

/// generated route for
/// [_i3.CreateFamilyPage]
class JRouter extends _i16.PageRouteInfo<void> {
  const JRouter()
      : super(
          JRouter.name,
          path: 'join',
        );

  static const String name = 'JRouter';
}

/// generated route for
/// [_i4.Home]
class HRouter extends _i16.PageRouteInfo<void> {
  const HRouter({List<_i16.PageRouteInfo>? children})
      : super(
          HRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class MeRouter extends _i16.PageRouteInfo<void> {
  const MeRouter({List<_i16.PageRouteInfo>? children})
      : super(
          MeRouter.name,
          path: 'me',
          initialChildren: children,
        );

  static const String name = 'MeRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class FamRouter extends _i16.PageRouteInfo<void> {
  const FamRouter({List<_i16.PageRouteInfo>? children})
      : super(
          FamRouter.name,
          path: 'fam',
          initialChildren: children,
        );

  static const String name = 'FamRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class CalRouter extends _i16.PageRouteInfo<void> {
  const CalRouter({List<_i16.PageRouteInfo>? children})
      : super(
          CalRouter.name,
          path: 'cal',
          initialChildren: children,
        );

  static const String name = 'CalRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class TasksRouter extends _i16.PageRouteInfo<void> {
  const TasksRouter({List<_i16.PageRouteInfo>? children})
      : super(
          TasksRouter.name,
          path: 'tasks',
          initialChildren: children,
        );

  static const String name = 'TasksRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ScoreRouter extends _i16.PageRouteInfo<void> {
  const ScoreRouter({List<_i16.PageRouteInfo>? children})
      : super(
          ScoreRouter.name,
          path: 'score',
          initialChildren: children,
        );

  static const String name = 'ScoreRouter';
}

/// generated route for
/// [_i6.Homepage]
class HomepageRoute extends _i16.PageRouteInfo<void> {
  const HomepageRoute()
      : super(
          HomepageRoute.name,
          path: '',
        );

  static const String name = 'HomepageRoute';
}

/// generated route for
/// [_i7.TaskPage]
class TaskPageRoute extends _i16.PageRouteInfo<void> {
  const TaskPageRoute()
      : super(
          TaskPageRoute.name,
          path: 'createTask',
        );

  static const String name = 'TaskPageRoute';
}

/// generated route for
/// [_i8.ShoppingListPage]
class ShoppingListPageRoute extends _i16.PageRouteInfo<void> {
  const ShoppingListPageRoute()
      : super(
          ShoppingListPageRoute.name,
          path: 'shoppingList',
        );

  static const String name = 'ShoppingListPageRoute';
}

/// generated route for
/// [_i9.ConfirmTaskPage]
class ConfirmTaskPageRoute extends _i16.PageRouteInfo<void> {
  const ConfirmTaskPageRoute()
      : super(
          ConfirmTaskPageRoute.name,
          path: 'ConfirmTask',
        );

  static const String name = 'ConfirmTaskPageRoute';
}

/// generated route for
/// [_i10.PocketMoneyPage]
class PocketMoneyPageRoute extends _i16.PageRouteInfo<void> {
  const PocketMoneyPageRoute()
      : super(
          PocketMoneyPageRoute.name,
          path: 'PocketMoney',
        );

  static const String name = 'PocketMoneyPageRoute';
}

/// generated route for
/// [_i11.ChildConfirmTaskPage]
class ChildConfirmTaskPageRoute extends _i16.PageRouteInfo<void> {
  const ChildConfirmTaskPageRoute()
      : super(
          ChildConfirmTaskPageRoute.name,
          path: 'CompletedTasks',
        );

  static const String name = 'ChildConfirmTaskPageRoute';
}

/// generated route for
/// [_i12.FamPage]
class FamPageRoute extends _i16.PageRouteInfo<void> {
  const FamPageRoute()
      : super(
          FamPageRoute.name,
          path: '',
        );

  static const String name = 'FamPageRoute';
}

/// generated route for
/// [_i13.CalenderPage]
class CalenderPageRoute extends _i16.PageRouteInfo<void> {
  const CalenderPageRoute()
      : super(
          CalenderPageRoute.name,
          path: '',
        );

  static const String name = 'CalenderPageRoute';
}

/// generated route for
/// [_i14.TasksBottomPage]
class TasksBottomPageRoute extends _i16.PageRouteInfo<void> {
  const TasksBottomPageRoute()
      : super(
          TasksBottomPageRoute.name,
          path: '',
        );

  static const String name = 'TasksBottomPageRoute';
}

/// generated route for
/// [_i15.ScorePage]
class ScorePageRoute extends _i16.PageRouteInfo<void> {
  const ScorePageRoute()
      : super(
          ScorePageRoute.name,
          path: '',
        );

  static const String name = 'ScorePageRoute';
}
