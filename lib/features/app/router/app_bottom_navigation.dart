import 'package:app_ui/app_ui.dart'
    show AppColors, AppStatusBar, kCircular20Border;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart';
import 'package:mobile_shop/features/features.dart';

// Your bottomNavigationBarItems list remains the same
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
    return AutoTabsScaffold(
      homeIndex: 0,

      appBarBuilder: (context, tabsRouter) {
        if (tabsRouter.activeIndex != 4) {
          return AppStatusBar(
            onAddressTap: () {},
            onNotificationTap: () {},
            onBookmarkTap: () {},
            onSearchTap: () {},
          );
        }
        return const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox.shrink(),
        );
      },
      transitionBuilder:
          (context, child, animation) =>
              FadeTransition(opacity: animation, child: child),
      routes: [
        HomeRoute(),
        CategoriesRoute(),
        BeveragesRoute(),
        DiscountRoute(),
        ProfileRoute(),
      ],

      backgroundColor: AppColors.bgMain,
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
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
              int destinationIndex = entry.key;
              Map<String, IconData> itemMap = entry.value;
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
        );
      },
      floatingActionButtonBuilder: (context, tabsRouter) {
        return BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, connectivityState) {
            final bool isOnline = connectivityState is! ConnectivityOffline;

            final bool isOnTargetRoute =
                tabsRouter.current.name == HomeRoute.name;
            if (isOnline && isOnTargetRoute) {
              return SizedBox(
                height: 35,
                width: 80,
                child: FloatingActionButton.extended(
                  tooltip: ' Cart',
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  onPressed: () => context.router.push(CartRoute()),
                  shape: RoundedRectangleBorder(
                    borderRadius: kCircular20Border,
                  ),
                  label: const FittedBox(child: Text('Корзина')),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

// Your NavigationDestinationIcon class remains the same
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
