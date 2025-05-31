import 'package:auto_route/auto_route.dart';
import 'package:mobile_shop/features/features.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AppBottomNavigation.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: MenuOneTab.page, path: 'menu/one'),
        AutoRoute(page: MenuTwoTab.page, path: 'menu/two'),
        AutoRoute(page: MenuThreeTab.page, path: 'menu/three'),
        AutoRoute(page: MenuFourTab.page, path: 'menu/four'),
        AutoRoute(page: ProfileRoute.page, path: 'menu/five'),
      ],
    ),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(page: CartRoute.page),
    AutoRoute(page: FavoritesRoute.page),
  ];
}
