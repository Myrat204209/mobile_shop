import 'package:app_ui/app_ui.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,

        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.close_rounded)),
        ],
        leading: SizedBox(),
        leadingWidth: 10,

        title: Text(
          'Корзина',
          style: AppTextStyle.text().titleBold().xl().withColor(
            AppColors.textColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 25),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.mainAccent),
              Expanded(
                child: AppBarMarqueeText(placemarkText: 'asdnasklndkjasndkjas'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonsTabBar(
                  borderColor: AppColors.mainAccent,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.mainAccent),
                  ),

                  unselectedBackgroundColor: Colors.white,
                  unselectedBorderColor: AppColors.iconColor.withAlpha(70),
                  onTap: (p0) => {},
                  borderWidth: 2,
                  radius: 10,
                  labelStyle: AppTextStyle.text().titleBold().withColor(
                    AppColors.textColor,
                  ),
                  unselectedLabelStyle: AppTextStyle.text().withColor(
                    AppColors.textColor,
                  ),
                  height: 50,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 185,
                  tabs: [
                    Tab(icon: Icon(Icons.directions_bike), text: "Доставка"),
                    Tab(
                      icon: Icon(Icons.location_on_outlined),
                      text: "Самовывоз",
                    ),
                  ],
                ),
                Text(
                  'Сегодня, 09:30 - 11:30',
                  style: AppTextStyle.text().title().withColor(
                    AppColors.iconColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 40,
            child:
                Text(
                  "askldjassssdahgsahdgasdjssahgdj",
                  style: AppTextStyle.text().title().semiBold(),
                ).centralize(),
          ).colorize(AppColors.iconColor.withAlpha(60)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('1 товар', style: AppTextStyle.text().titleBold().xxl()),
              
            ],
          ).paddingSymmetric(horizontal: 10),
        ],
      ),
    );
  }
}
