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
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: BeveragesRoute.page),
        AutoRoute(page: DiscountRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
  ];
}
