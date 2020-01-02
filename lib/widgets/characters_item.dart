import 'package:flutter/material.dart';
import 'package:marvel/models/characters/character.dart';
import 'package:marvel/screens/character_detail_screen.dart';
// import 'package:provider/provider.dart';

// import 'package:marvel/providers/characters_provider.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  CharacterItem(this.character);

  @override
  Widget build(BuildContext context) {
    // final character = Provider.of<CharactersProviders>(context, listen: false);

    // character.selectCharcters(id);
    // final onecharacter = character.selectedCharacter;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              CharacterDetailScreen.routeName,
              arguments: '${character.id}',
            );
          },
          child: Image.network(
            '${character.thumbnail.path}.${character.thumbnail.extension}',
            fit: BoxFit.cover,
          ),
        ),
        // footer: GridTileBar(
        //   backgroundColor: Colors.black45,
        //   title: Text(
        //     character.name,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ),
    );
  }
}
