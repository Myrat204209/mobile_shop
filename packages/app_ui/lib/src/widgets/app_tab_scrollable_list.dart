import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

// Let's define a simple data structure for our example
class TabbedItem {
  const TabbedItem({required this.category, required this.title});
  final String category;
  final String title;
}

class AppTabScrollableList extends StatelessWidget {
  const AppTabScrollableList({super.key});

  // Sample data: A list of items, each with a category and a title.
  // The categories will become our tabs.
  static final List<TabbedItem> _items = List.generate(
    30,
    (index) => TabbedItem(
      category: 'Category ${(index ~/ 10) + 1}', // 3 categories, 10 items each
      title: 'Item $index',
    ),
  );

  // Group items by category for the ScrollableListTabScroller
  static final Map<String, List<TabbedItem>> _groupedItems = _items.fold(
    <String, List<TabbedItem>>{},
    (map, item) {
      map.putIfAbsent(item.category, () => []).add(item);
      return map;
    },
  );

  static final List<String> _categories = _groupedItems.keys.toList();

  @override
  Widget build(BuildContext context) {
    return ScrollableListTabScroller(
      // The number of tabs (categories)
      itemCount: _categories.length,
      // Builds each tab
      tabBuilder: (BuildContext context, int index, bool active) {
        final category = _categories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            category,
            style: TextStyle(
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
              color: active ? Theme.of(context).primaryColor : Colors.black54,
            ),
          ),
        );
      },
      // Builds the content for each tab/category
      itemBuilder: (BuildContext context, int tabIndex) {
        final category = _categories[tabIndex];
        final itemsInCategory = _groupedItems[category]!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(category, style: Theme.of(context).textTheme.headlineSmall),
            ),
            ...itemsInCategory.map((item) => ListTile(title: Text(item.title))),
          ],
        );
      },
      // Optional: Customize the container for the tabs if needed
      // headerContainerBuilder: (context, child) => Card(elevation: 2, margin: EdgeInsets.zero, child: child),
    );
  }
}
