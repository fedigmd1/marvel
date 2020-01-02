import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marvel/providers/characters_provider.dart';

class CharacterDetailScreen extends StatelessWidget {
  static const routeName = '/character-detail';

  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context).settings.arguments as String;
    // .......(context, listen: true).find.........; by default listen is true
    final loadedComicCharacters =
        Provider.of<CharactersProviders>(context).findById(characterId);
    //print(loadedcomic.id.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedComicCharacters.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: loadedComicCharacters.thumbnail.path
                      .contains('/image_not_available')
                  ? Image.asset(
                      'assets/images/marvelB.jpg',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      '${loadedComicCharacters.thumbnail.path}.${loadedComicCharacters.thumbnail.extension}',
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                '${loadedComicCharacters.name}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedComicCharacters.description != null
                    ? loadedComicCharacters.description
                    : 'No Description',
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
