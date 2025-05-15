import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: SizedBox.square(
            dimension: 40,
            child: Icon(Icons.shopping_bag_outlined),
          ).colorize(AppColors.iconColor.withAlpha(20)),
          title: Text('Заказы'),
          subtitle: Text('data'),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right_outlined),
          ),
          dense: true,
          visualDensity: VisualDensity.compact,
        ),
        Divider(
          indent: 60,
          height: 5,
          endIndent: 30,
          color: AppColors.iconColor.withAlpha(20),
        ),
      ],
    );
  }
}
