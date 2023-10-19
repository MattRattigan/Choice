// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:no_name_app/components/side_menu.dart' as _i8;
import 'package:no_name_app/pages/favorites/favorite_list.dart' as _i1;
import 'package:no_name_app/pages/favorites/favorite_page.dart' as _i2;
import 'package:no_name_app/pages/home_screen.dart' as _i3;
import 'package:no_name_app/pages/intro_screen.dart' as _i4;
import 'package:no_name_app/pages/login_screen.dart' as _i5;
import 'package:no_name_app/pages/questions_screen.dart' as _i6;
import 'package:no_name_app/pages/random_choice_screen.dart' as _i10;
import 'package:no_name_app/pages/settings_screen.dart' as _i7;
import 'package:no_name_app/pages/splash_screen.dart' as _i9;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    FavoriteList.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FavoriteList(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeScreen(key: args.key),
      );
    },
    IntroRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.IntroScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    QuestionRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.QuestionScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsScreen(),
      );
    },
    Sidebar.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Sidebar(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SplashScreen(key: args.key),
      );
    },
    WheelRoute.name: (routeData) {
      final args = routeData.argsAs<WheelRouteArgs>(
          orElse: () => const WheelRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WheelScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.FavoriteList]
class FavoriteList extends _i11.PageRouteInfo<void> {
  const FavoriteList({List<_i11.PageRouteInfo>? children})
      : super(
          FavoriteList.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteList';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoritePage]
class FavoriteRoute extends _i11.PageRouteInfo<void> {
  const FavoriteRoute({List<_i11.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<HomeRouteArgs> page =
      _i11.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.IntroScreen]
class IntroRoute extends _i11.PageRouteInfo<void> {
  const IntroRoute({List<_i11.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.QuestionScreen]
class QuestionRoute extends _i11.PageRouteInfo<void> {
  const QuestionRoute({List<_i11.PageRouteInfo>? children})
      : super(
          QuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuestionRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Sidebar]
class Sidebar extends _i11.PageRouteInfo<void> {
  const Sidebar({List<_i11.PageRouteInfo>? children})
      : super(
          Sidebar.name,
          initialChildren: children,
        );

  static const String name = 'Sidebar';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<SplashRouteArgs> page =
      _i11.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.WheelScreen]
class WheelRoute extends _i11.PageRouteInfo<WheelRouteArgs> {
  WheelRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          WheelRoute.name,
          args: WheelRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WheelRoute';

  static const _i11.PageInfo<WheelRouteArgs> page =
      _i11.PageInfo<WheelRouteArgs>(name);
}

class WheelRouteArgs {
  const WheelRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'WheelRouteArgs{key: $key}';
  }
}
