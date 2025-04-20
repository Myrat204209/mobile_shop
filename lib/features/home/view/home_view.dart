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
          centerTitle: true,
          // leading: Container(
          //   margin: EdgeInsets.only(top: 10),
          //   color: Colors.amber,
          //   child: HomeMarqueeText(),
          // ),
          // leadingWidth: 300,
          title: SizedBox(height: 10, child: HomeMarqueeText()),

          // title: HomeMarqueeText(),
          floating: true,
          pinned: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border_outlined),
            ),
          ],
          snap: true,
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(48),
          //   child: TextFormField(initialValue: 'Value'),
          // ),
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
