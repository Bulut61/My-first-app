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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/homepage.dart' as _i2;
import '../pages/sign_in_page.dart' as _i1;
import '../pages/task_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SignInPageRoute.name: (routeData) {
      final args = routeData.argsAs<SignInPageRouteArgs>(
          orElse: () => const SignInPageRouteArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignInPage(key: args.key),
      );
    },
    HomepageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Homepage(),
      );
    },
    TaskPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TaskPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SignInPageRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          HomepageRoute.name,
          path: 'homepage',
        ),
        _i4.RouteConfig(
          TaskPageRoute.name,
          path: 'tasks',
        ),
      ];
}

/// generated route for
/// [_i1.SignInPage]
class SignInPageRoute extends _i4.PageRouteInfo<SignInPageRouteArgs> {
  SignInPageRoute({_i5.Key? key})
      : super(
          SignInPageRoute.name,
          path: '/',
          args: SignInPageRouteArgs(key: key),
        );

  static const String name = 'SignInPageRoute';
}

class SignInPageRouteArgs {
  const SignInPageRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SignInPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.Homepage]
class HomepageRoute extends _i4.PageRouteInfo<void> {
  const HomepageRoute()
      : super(
          HomepageRoute.name,
          path: 'homepage',
        );

  static const String name = 'HomepageRoute';
}

/// generated route for
/// [_i3.TaskPage]
class TaskPageRoute extends _i4.PageRouteInfo<void> {
  const TaskPageRoute()
      : super(
          TaskPageRoute.name,
          path: 'tasks',
        );

  static const String name = 'TaskPageRoute';
}
