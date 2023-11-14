import 'package:flutter/material.dart';

import 'card_item_menu.dart';

class CardList extends StatelessWidget {
  final List<CardItemMenu> items;

  CardList({required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return SizedBox(
            height: 140,
            width: 150,
            child: item,
          );
        }).toList(),
      ),
    );
  }
}
