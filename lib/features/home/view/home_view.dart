import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset(
            //     'assets/images/back.jpg',
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverFillRemaining(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
