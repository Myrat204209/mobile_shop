// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart' show AppColors, AppTextStyle;
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/home.dart';

class HomeLocationSearchAppBar extends StatelessWidget {
  const HomeLocationSearchAppBar({super.key, this.locationText});
  final String? locationText;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: true,
      actionsPadding: EdgeInsets.zero,
      expandedHeight: 100,
      titleSpacing: 0,
      leading: Icon(
        Icons.directions_bike_outlined,
        size: 30,
        color: AppColors.secondAccent,
      ),
      leadingWidth: 50,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: HomeMarqueeText(placemarkText: locationText)),
          AppActionIcon(
            icon: CupertinoIcons.chevron_right,
            onTap: () {},
            size: 20,
          ),
        ],
      ),
      floating: true,
      pinned: true,
      actions: [
        AppActionIcon(icon: CupertinoIcons.bell, onTap: () {}),
        AppActionIcon(icon: Icons.bookmark_border_outlined, onTap: () {}),
      ],
      forceMaterialTransparency: true,
      snap: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: SearchAnchor.bar(
            barPadding: WidgetStatePropertyAll(EdgeInsets.only(left: 8)),
            barLeading: Icon(
              CupertinoIcons.search,
              size: 30,
              color: AppColors.iconColor.withValues(alpha: 0.5),
            ),
            constraints: BoxConstraints(minHeight: 44),
            barElevation: WidgetStatePropertyAll(0),
            barHintText: 'Найти в Дикси',
            barHintStyle: WidgetStatePropertyAll(
              AppTextStyle.text(color: AppColors.textLight),
            ),
            barShape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: AppColors.border),
              ),
            ),

            barTrailing: [
              SizedBox(
                height: 44,
                child: VerticalDivider(
                  width: 1,
                  color: AppColors.border,
                  thickness: 2,
                  indent: 8,
                  endIndent: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AppActionIcon(
                  icon: CupertinoIcons.barcode_viewfinder,
                  size: 29,
                  color: AppColors.iconColor.withValues(alpha: 0.5),
                  onTap: () {},
                ),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(CupertinoIcons.barcode_viewfinder),
              // ),
            ],
            // barSide: WidgetStatePropertyAll(BorderSide(color: Colors.red)),
            suggestionsBuilder: (context, controller) {
              return [];
            },
          ),
        ),
      ),
    );
  }
}

class AppActionIcon extends StatelessWidget {
  const AppActionIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = AppColors.iconColor,
    this.size = 24,
  });

  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      iconSize: size,
      visualDensity: VisualDensity.compact,
      onPressed: onTap,
      icon: Icon(icon, color: color),
    );
  }
}
