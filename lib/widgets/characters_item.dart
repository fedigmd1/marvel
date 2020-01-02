import 'package:flutter/material.dart';
import 'package:marvel/screens/character_detail_screen.dart';
import 'package:provider/provider.dart';

import 'package:marvel/providers/characters_provider.dart';

class CharacterItem extends StatelessWidget {
  final int id;
  CharacterItem(this.id);

  @override
  Widget build(BuildContext context) {
    final character = Provider.of<CharactersProviders>(context, listen: false);

    character.selectCharcters(id);
    final onecharacter = character.selectedCharacter;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              CharacterDetailScreen.routeName,
              arguments: '${onecharacter.id}',
            );
          },
          child: Image.network(
            '${onecharacter.thumbnail.path}.${onecharacter.thumbnail.extension}',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            onecharacter.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
