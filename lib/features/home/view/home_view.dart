import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override

  Widget build(BuildContext context) {
    final _controller  = ScrollController();
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
        SliverList.builder(
          itemBuilder:
              (context, index) => ListTile(title: Text('Index: $index')),
          itemCount: 20,
        ),
      ],
    );
  }
}
