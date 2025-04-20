import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/widgets/home_marquee_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          primary: true,
          title: ColoredBox(
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: SizedBox(height: 25, child: HomeMarqueeText())),
                SizedBox(width: 10),
                IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right_outlined),
                ),
              ],
            ),
          ),
          floating: true,
          pinned: true,
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: Icon(Icons.notifications_none),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: Icon(Icons.bookmark_border_outlined),
            ),
          ],
          forceMaterialTransparency: true,
          snap: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SearchAnchor.bar(
                barLeading: Icon(Icons.search),
                constraints: BoxConstraints(minHeight: 44),
                barElevation: WidgetStatePropertyAll(0),
                barShape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                barTrailing: [
                  VerticalDivider(color: Colors.grey, width: 1),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.qr_code_scanner_outlined),
                  ),
                ],
                barSide: WidgetStatePropertyAll(BorderSide(color: Colors.grey)),
                suggestionsBuilder: (context, controller) {
                  return [];
                },
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder:
              (context, index) => ListTile(title: Text('Index: $index')),
          itemCount: 20,
        ),
      ],
    );
  }
}
