import 'package:auto_route/auto_route.dart';
import 'package:no_name_app/routes/app_routing.gr.dart';

// part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: IntroRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: Sidebar.page),
        AutoRoute(page: WheelRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: FavoriteList.page),
        AutoRoute(page: QuestionRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}


// homeScreen -> NaviRoute
// favoriteList -> FavoriteList.page
// questionScreen -> QuestionRoute.oage
// settingsScreen -> SettingsRoute.page