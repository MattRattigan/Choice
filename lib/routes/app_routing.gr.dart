// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:no_name_app/components/side_menu.dart' as _i9;
import 'package:no_name_app/pages/favorites/favorite_list.dart' as _i1;
import 'package:no_name_app/pages/favorites/favorite_page.dart' as _i2;
import 'package:no_name_app/pages/home_screen.dart' as _i3;
import 'package:no_name_app/pages/intro_screen.dart' as _i4;
import 'package:no_name_app/pages/login_screen.dart' as _i5;
import 'package:no_name_app/pages/questions_screen.dart' as _i6;
import 'package:no_name_app/pages/random_choice_screen.dart' as _i11;
import 'package:no_name_app/pages/register_screen.dart' as _i7;
import 'package:no_name_app/pages/settings_screen.dart' as _i8;
import 'package:no_name_app/pages/splash_screen.dart' as _i10;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    FavoriteList.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FavoriteList(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    IntroRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.IntroScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    QuestionRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.QuestionScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsScreen(),
      );
    },
    Sidebar.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Sidebar(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
    WheelRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.WheelScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.FavoriteList]
class FavoriteList extends _i12.PageRouteInfo<void> {
  const FavoriteList({List<_i12.PageRouteInfo>? children})
      : super(
          FavoriteList.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteList';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoritePage]
class FavoriteRoute extends _i12.PageRouteInfo<void> {
  const FavoriteRoute({List<_i12.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<HomeRouteArgs> page =
      _i12.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.IntroScreen]
class IntroRoute extends _i12.PageRouteInfo<void> {
  const IntroRoute({List<_i12.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.QuestionScreen]
class QuestionRoute extends _i12.PageRouteInfo<void> {
  const QuestionRoute({List<_i12.PageRouteInfo>? children})
      : super(
          QuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuestionRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SettingsScreen]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Sidebar]
class Sidebar extends _i12.PageRouteInfo<void> {
  const Sidebar({List<_i12.PageRouteInfo>? children})
      : super(
          Sidebar.name,
          initialChildren: children,
        );

  static const String name = 'Sidebar';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.WheelScreen]
class WheelRoute extends _i12.PageRouteInfo<void> {
  const WheelRoute({List<_i12.PageRouteInfo>? children})
      : super(
          WheelRoute.name,
          initialChildren: children,
        );

  static const String name = 'WheelRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
