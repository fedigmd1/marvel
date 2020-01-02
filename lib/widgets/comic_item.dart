import 'package:flutter/material.dart';
import 'package:marvel/models/comics/comic.dart';
import 'package:marvel/screens/comic_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:marvel/providers/comics_provider.dart';
import 'package:marvel/providers/characters_provider.dart';

class ComicItem extends StatelessWidget {
  final Comic comic;

  ComicItem(this.comic);
  @override
  Widget build(BuildContext context) {
    final comicPrv = Provider.of<ComicsProviders>(context, listen: false);
    final character = Provider.of<CharactersProviders>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // comicPrv.selectComic(comic);
            // final oneComic = comicPrv.selectedComic;
            character.setComicId(comic.id);
            Navigator.of(context).pushNamed(
              ComicDetailScreen.routeName,
              arguments: '${comic.id}',
            );
          },
          child: comic.thumbnail.path.contains('/image_not_available')
              ? Image.asset(
                  'assets/images/marvelA.png',
                  fit: BoxFit.cover,
                )
              : Image.network(
                  '${comic.thumbnail.path}.${comic.thumbnail.extension}',
                  fit: BoxFit.cover,
                ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            comic.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
