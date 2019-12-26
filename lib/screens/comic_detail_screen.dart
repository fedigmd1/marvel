import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marvel/providers/comics_provider.dart';

class ComicDetailScreen extends StatelessWidget {
  static const routeName = '/comic-detail';
  // final String title;
  // final double price;
  //ProductDetailScreen(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    final comicId = ModalRoute.of(context).settings.arguments as String;
    // .......(context, listen: true).find.........; by default listen is true
    final loadedcomic = Provider.of<ComicsProviders>(context).findById(comicId);
    //print(loadedcomic.id.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedcomic.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: loadedcomic.thumbnail.path.contains('/image_not_available')
                  ? Image.asset('assets/images/marvelA.png')
                  : Image.network(
                      '${loadedcomic.thumbnail.path}.${loadedcomic.thumbnail.extension}',
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 10),
            Text(
              '',
              //'${loadedcomic.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedcomic.description != null
                    ? loadedcomic.description
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
