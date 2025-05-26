// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class Product {
  final String name;
  final String price;
  final String imageUrl; // or assetPath

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductCategory {
  final String title;
  final List<Product> products;

  ProductCategory({required this.title, required this.products});
}

final List<ProductCategory> allCategories = [
  ProductCategory(
    title: 'Готовая еда',
    products: [
      Product(
        name: 'Готовый завтрак Бон Пари',
        price: '139.99 ₽/шт',
        imageUrl: 'assets/bon_pari.png',
      ),
      Product(
        name: 'Плов Российская Корона',
        price: '149.99 ₽/шт',
        imageUrl: 'assets/plov.png',
      ),
    ],
  ),
  ProductCategory(
    title: 'Напитки',
    products: [
      Product(
        name: 'Сок Добрый',
        price: '99.99 ₽/шт',
        imageUrl: 'assets/sok_dobry.png',
      ),
    ],
  ),
  ProductCategory(
    title: 'Нfапитки',
    products: [
      Product(
        name: 'Сок Добрый',
        price: '99.99 ₽/шт',
        imageUrl: 'assets/sok_dobry.png',
      ),
    ],
  ),
  ProductCategory(
    title: 'Наasdasdasпитки',
    products: [
      Product(
        name: 'Сок Добрый',
        price: '99.99 ₽/шт',
        imageUrl: 'assets/sok_dobry.png',
      ),
    ],
  ),
  ProductCategory(
    title: 'Напитк2и',
    products: [
      Product(
        name: 'Сок Добрый',
        price: '99.99 ₽/шт',
        imageUrl: 'assets/sok_dobry.png',
      ),
    ],
  ),
];

class AppStickyHeaderList extends StatelessWidget {
  final List<ProductCategory> categories = allCategories;
  AppStickyHeaderList({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Скидки по карте'),
            backgroundColor: AppColors.mainAccent,
            pinned: true,
            floating: false,
            actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
          ),

          for (final category in categories)
            SliverStickyHeader(
              // sticky: true,
              // overlapHeaders: false, // Default, ensures headers replace each other
              header: Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
                  ),
                ),
                child: Text(
                  category.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              sliver: SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    final product = category.products[index];
                    return ProductDetailsCard(
                      onProductTapped: onPressed,
                      product: product,
                    );
                  }, childCount: category.products.length),
                ),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    required this.product,
    required this.onProductTapped,
  });

  final Product product;
  final VoidCallback onProductTapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onProductTapped,
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex: 3, child: FlutterLogo()),
            Expanded(
              flex: 2, // Less space for text details
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Distribute space
                  children: <Widget>[
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.price,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        // Your "+" button
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton.filled(
                            padding: EdgeInsets.zero,
                            iconSize: 18,
                            icon: Icon(Icons.add),
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
