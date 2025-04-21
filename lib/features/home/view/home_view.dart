import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/home.dart';

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
                  icon: Icon(CupertinoIcons.chevron_right),
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
              icon: Icon(CupertinoIcons.bell),
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
                barPadding: WidgetStatePropertyAll(EdgeInsets.only(left: 8)),
                barLeading: Icon(CupertinoIcons.search, size: 30),
                constraints: BoxConstraints(minHeight: 44),
                barElevation: WidgetStatePropertyAll(0),
                barHintText: 'Найти в Дикси',
                barHintStyle: WidgetStatePropertyAll(
                  AppTextStyle.text(color: Colors.grey),
                ),

                barShape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                barTrailing: [
                  SizedBox(
                    height: 44,
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.shade400,
                      thickness: 2,
                      indent: 8,
                      endIndent: 8,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.barcode_viewfinder),
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
        HomeFriendsSlider(),
      ],
    );
  }
}

