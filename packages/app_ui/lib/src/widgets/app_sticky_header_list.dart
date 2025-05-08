import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

// Assume Product and ProductCategory models are defined as above
// Example Data Structure (using simplified models for clarity)
class Product {
  final String name;
  final String price;
  final String imageUrl; // or assetPath
  // ... other properties like discount, rating

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductCategory {
  final String title; // e.g., "Готовая еда", "Молочные продукты"
  final List<Product> products;

  ProductCategory({required this.title, required this.products});
}

// Sample Data
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
      // ... more products for Готовая еда
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
      // ... more products for Напитки
    ],
  ),
  // ... more categories
];

class AppStickyHeaderList extends StatelessWidget {
  final List<ProductCategory> categories =
      allCategories; // Your actual data source

  AppStickyHeaderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. Main App Bar (if it needs to be part of the scroll)
          const SliverAppBar(
            title: Text('Скидки по карте'), // Or dynamic based on context
            pinned: true, // Makes the main app bar sticky
            floating: false,
            actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
            // elevation: 1.0, // Optional elevation
            // backgroundColor: Colors.white, // Or your theme's app bar color
          ),

          // 2. Iterate over your categories to create sticky header sections
          for (final category in categories)
            SliverStickyHeader(
              // sticky: true, // Default is true
              // overlapHeaders: false, // Default, ensures headers replace each other

              // ----- The Header for each category (e.g., "Готовая еда") -----
              header: Container(
                height: 50.0, // Adjust height as needed
                color:
                    Theme.of(
                      context,
                    ).scaffoldBackgroundColor, // Or a specific header background
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                // Optional: Add a border like in some designs
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
                  ),
                ),
                child: Text(
                  category.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // color: Colors.black87, // Or your theme's text color
                  ),
                ),
              ),

              // ----- The Content Sliver for each category (the product grid) -----
              sliver: SliverPadding(
                // Add padding around the grid itself if needed
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items per row
                    mainAxisSpacing: 12.0, // Spacing between rows
                    crossAxisSpacing: 12.0, // Spacing between columns
                    childAspectRatio:
                        0.65, // Adjust to fit your product card design (width / height)
                  ),
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    final product = category.products[index];
                    return _buildProductCard(context, product);
                  }, childCount: category.products.length),
                ),
              ),
            ),
          // Add a SliverToBoxAdapter for bottom padding if needed,
          // so the last items don't get stuck behind a bottom navigation bar for example.
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      // Your BottomNavigationBar would go here if it's a full screen
      // bottomNavigationBar: BottomNavigationBar(...),
    );
  }

  // Helper widget to build each product card (similar to your previous card structure)
  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias, // Important for rounded corners on Image
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment
                .stretch, // Make column children stretch horizontally
        children: <Widget>[
          Expanded(
            flex: 3, // Give more space to the image
            child: Image.asset(
              // Or Image.network if URLs
              product.imageUrl,
              fit: BoxFit.cover,
              // Optional: Error builder for images
              errorBuilder:
                  (context, error, stackTrace) => const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
            ),
          ),
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
                  // Add discount badges or other info here if needed
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
    );
  }
}
