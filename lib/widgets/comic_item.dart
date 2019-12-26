import 'package:flutter/material.dart';
import 'package:marvel/screens/comic_detail_screen.dart';
import 'package:provider/provider.dart';

import 'package:marvel/models/comics/comic.dart';
//import 'package:marvel/providers/comics_provider.dart';

class ComicItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final comic = Provider.of<Comic>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ComicDetailScreen.routeName,
              arguments: '${comic.id}',
            );
          },
          child: Image.network(
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
