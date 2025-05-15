import 'package:app_ui/app_ui.dart' show AppColors, kCircular20Border;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart';
import 'package:mobile_shop/features/features.dart';

List<Map<String, IconData>> bottomNavigationBarItems = [
  {'Начало': Icons.home},
  {'Каталог': Icons.grid_view},
  {'Напитки': Icons.emoji_food_beverage_rounded},
  {'Акции': Icons.discount_rounded},
  {'Профиль': CupertinoIcons.smiley},
];

@RoutePage()
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        CategoriesRoute(),
        BeveragesRoute(),
        DiscountRoute(),
        ProfileRoute(),
      ],
      transitionBuilder:
          (context, child, animation) =>
              FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          backgroundColor: AppColors.bgMain,
          bottomNavigationBar: NavigationBar(
            indicatorColor: Colors.transparent,
            selectedIndex: tabsRouter.activeIndex,

            onDestinationSelected: (index) {
              if (tabsRouter.activeIndex != index) {
                tabsRouter.setActiveIndex(index);
              } else {
                tabsRouter
                    .innerRouterOf<StackRouter>(tabsRouter.current.name)
                    ?.popUntilRoot();
              }
            },

            destinations: [
              ...bottomNavigationBarItems.asMap().entries.map((entry) {
                // entry is a MapEntry<int, Map<String, IconData>>
                // entry.key is the index (which will be our destinationIndex)
                // entry.value is the map like {'Начало': Icons.home}

                int destinationIndex = entry.key;
                Map<String, IconData> itemMap = entry.value;

                // Since each map has exactly one key-value pair:
                String label = itemMap.keys.first;
                IconData icon = itemMap.values.first;

                return NavigationDestinationIcon(
                  tabsRouterIndex: tabsRouter.activeIndex,
                  destinationIndex: destinationIndex,
                  icon: icon,
                  label: label,
                );
              }),
            ],
            height: 56,
            indicatorShape: null,

            backgroundColor: Colors.white,
          ),
          floatingActionButton:
              BlocBuilder<ConnectivityBloc, ConnectivityState>(
                builder: (context, connectivityState) {
                  final bool showFab =
                      connectivityState is! ConnectivityOffline;
                  if (!showFab) {
                    return const SizedBox.shrink();
                  }
                  return SizedBox(
                    height: 35,
                    width: 80,
                    child: FloatingActionButton.extended(
                      tooltip: ' Cart',
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        final currentRouteName = tabsRouter.current.name;
                        if (currentRouteName == HomeRoute.name) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Home FAB Action!')),
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: kCircular20Border,
                      ),
                      label: FittedBox(child: Text('Корзина')),
                    ),
                  );
                },
              ),
        );
      },
    );
  }
}

class NavigationDestinationIcon extends StatelessWidget {
  const NavigationDestinationIcon({
    super.key,
    required this.tabsRouterIndex,
    required this.destinationIndex,
    required this.icon,
    required this.label,
  });

  final int tabsRouterIndex;
  final int destinationIndex;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color:
            tabsRouterIndex == destinationIndex
                ? AppColors.mainAccent
                : AppColors.iconColor,
      ),
      label: label,
    );
  }
}
