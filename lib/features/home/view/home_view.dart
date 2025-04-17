import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/widgets/home_marquee_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverAppBar(
          primary: true,
          centerTitle: true,
          title: Text('Home'),
          floating: true,
          backgroundColor: Colors.red,
          pinned: true,
          snap: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: ColoredBox(
              color: Colors.yellow,
              child: TextFormField(initialValue: 'Value'),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            width: 360,
            child: const HomeMarqueeText(),
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
