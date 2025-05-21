import 'package:app_ui/app_ui.dart' show AppColors, kCircular20Border;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart'; // Assuming your ConnectivityBloc and states are here
import 'package:mobile_shop/features/features.dart'; // Assuming your route names are accessible, e.g., HomeRoute.name

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
          ),
          floatingActionButton: BlocBuilder<
            ConnectivityBloc,
            ConnectivityState
          >(
            builder: (context, connectivityState) {
              // Determine if the FAB should be shown based on connectivity AND current route
              final bool isOnline = connectivityState is! ConnectivityOffline;
              // 👇 **MODIFICATION HERE** 👇
              // Replace HomeRoute.name with the actual name of your target route if different
              // For example, if your target route is CategoriesRoute, use CategoriesRoute.name
              final bool isOnTargetRoute =
                  tabsRouter.current.name == HomeRoute.name;
              // You can also use activeIndex if you prefer:
              // final bool isOnTargetRoute = tabsRouter.activeIndex == 0; // Assuming HomeRoute is the first route (index 0)

              // Show FAB only if online AND on the target route
              if (isOnline && isOnTargetRoute) {
                return SizedBox(
                  height: 35,
                  width: 80,
                  child: FloatingActionButton.extended(
                    tooltip: ' Cart',
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      context.router.push(CartRoute());
                      // You can keep the route-specific action here if needed
                      // final currentRouteName = tabsRouter.current.name;
                      // if (currentRouteName == HomeRoute.name) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Home FAB Action!')),
                      //   );
                      // }
                      // // Add other actions or navigation for the cart here
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: kCircular20Border,
                    ),
                    label: const FittedBox(child: Text('Корзина')),
                  ),
                );
              } else {
                // Otherwise, show an empty container (FAB is hidden)
                return const SizedBox.shrink();
              }
            },
          ),
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
