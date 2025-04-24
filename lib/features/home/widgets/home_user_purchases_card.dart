// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class HomeUserPurchasesCard extends StatelessWidget {
  const HomeUserPurchasesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTile(title: Text('Мои покупки')),
          Container(
            constraints: BoxConstraints(maxHeight: 130),
            color: Colors.blueAccent,
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
