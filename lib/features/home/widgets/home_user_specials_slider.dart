// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class HomeUserSpecialsSlider extends StatelessWidget {
  const HomeUserSpecialsSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Товары со скидкой, предназначенные специально для данного пользователя',
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 250),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
    
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 140,
                  color: Colors.teal[100 * (index % 9 + 1)],
                  alignment: Alignment.center,
    
                  child: Text('$index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
