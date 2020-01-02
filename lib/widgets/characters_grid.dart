import 'package:flutter/material.dart';
import 'package:marvel/widgets/characters_item.dart';
import 'package:provider/provider.dart';
import 'package:marvel/providers/characters_provider.dart';

class CharactersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final character = Provider.of<CharactersProviders>(context).items;
    return Container(
      height: 300,
      width: 300,
      child: GridView.builder(
        //scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10.0),
        itemCount: character.length,
        itemBuilder: (ctx, i) => CharacterItem(i),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
