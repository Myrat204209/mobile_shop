import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/core.dart';
import 'package:mobile_shop/features/features.dart';

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
          bottomNavigationBar: BottomNavigationBar(
            // Get the current index from the TabsRouter
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (tabsRouter.activeIndex != index) {
                tabsRouter.setActiveIndex(index);
              } else {
                tabsRouter
                    .innerRouterOf<StackRouter>(tabsRouter.current.name)
                    ?.popUntilRoot();
              }
            },
            // Define your navigation bar items
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Начало',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_grid_2x2),
                label: 'Каталог',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_food_beverage_rounded),
                label: 'Напитки',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.discount_rounded),
                label: 'Акции',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.smiley),
                label: 'Профиль',
              ),
            ],

            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
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
                        borderRadius: BorderRadius.circular(20),
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
