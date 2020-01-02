import 'package:flutter/material.dart';
import 'package:marvel/widgets/comic_item.dart';
import 'package:provider/provider.dart';
import 'package:marvel/providers/comics_provider.dart';

class ComicsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comics = Provider.of<ComicsProviders>(context).items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: comics.length,
      itemBuilder: (ctx, i) => ComicItem(comics[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}