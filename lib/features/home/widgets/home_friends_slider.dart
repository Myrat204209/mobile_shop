import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class HomeFriendsSlider extends StatelessWidget {
  const HomeFriendsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Text(
                'Клуб Друзей Дикси',
                style: AppTextStyle.text().titleBold(),
              ),
              contentPadding: EdgeInsets.zero,
              onTap: (){
                // context.pushRoute(routes.friendsRoute());
              },
              trailing: Icon(CupertinoIcons.chevron_right),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      width: 150,
                      height: 100,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      alignment: Alignment.center,
                      child: Text('Index 0'),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 65,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      color: Colors.teal[100 * (index % 9)],
                    ),
                    child: Text('Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
