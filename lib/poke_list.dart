import 'package:flutter/material.dart';

import './poke_list_item.dart';

class PokeList extends StatelessWidget {
  const PokeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      itemCount: 100,
      itemBuilder: (context, index) => PokeListItem(index: index),
    );
  }
}
