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
          ).paddingSymmetric(horizontal: 10),
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
              Row(
                children: [
                  Text('1 товар', style: AppTextStyle.text().titleBold().xxl()),
                  Spacer(),
                  Text(
                    '5.07 кг',
                    style: AppTextStyle.text().title().withColor(
                      AppColors.iconColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Single Cart Item Card
              _buildCartItemCard(), // Extracted to a helper method
              const SizedBox(height: 20),
              // --- Promo Code Section ---
              _buildPromoCodeSection(),
            ],
          ).paddingSymmetric(horizontal: 10),
          Spacer(),
          _buildBottomSummary().paddingAll(15),
        ],
      ),
    );
  }

  Widget _buildCartItemCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(width: 12),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Вода Первым Делом питьевая негазированная 5л', // Water First Thing drinking non-carbonated 5l
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '69.99 ₽/шт', // Original price
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '69.00 ₽', // Current price
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Quantity Selector
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'itemQuantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 20, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the promo code section
  Widget _buildPromoCodeSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          print('Promo code section tapped');
          // Navigate to promo code screen or open a dialog
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              Icon(
                Icons.local_offer_outlined,
                color: Colors.orange,
              ), // Discount tag icon
              SizedBox(width: 12),
              Text(
                'Промокод или сертификат', // Promo code or certificate
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the sticky bottom summary
  Widget _buildBottomSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          // Price Summary (Left side)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize
                    .min, // To make the column only take necessary vertical space
            children: const [
              Text(
                '69.00 ₽', // Total amount
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '1 товар - 5,07 кг', // 1 item - 5.07 kg
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(), // Pushes the button to the right
          // "Check Discounts" Button (Right side)
          ElevatedButton(
            onPressed: () {
              // Implement logic to check discounts or proceed to checkout
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Example button color
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3, // Button shadow
            ),
            child: const Text(
              'Проверить скидки', // Check discounts
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
