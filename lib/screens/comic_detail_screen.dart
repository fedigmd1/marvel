import 'package:flutter/material.dart';
import 'package:marvel/widgets/characters_grid.dart';
import 'package:provider/provider.dart';
import 'package:marvel/providers/characters_provider.dart';
import 'package:marvel/providers/comics_provider.dart';

class ComicDetailScreen extends StatefulWidget {
  static const routeName = '/comic-detail';

  @override
  _ComicDetailScreenState createState() => _ComicDetailScreenState();
}

class _ComicDetailScreenState extends State<ComicDetailScreen> {
  var _isInit = true;
  var _isLoading = false;
  var data = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final dataExtracted = Provider.of<CharactersProviders>(context);
      dataExtracted.getcomicCharacters().then((_) {
        setState(() {
          _isLoading = false;
          data = dataExtracted.items;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

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
                  ? Image.asset(
                      'assets/images/marvelB.jpg',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      '${loadedcomic.thumbnail.path}.${loadedcomic.thumbnail.extension}',
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                '${loadedcomic.title}',
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
                loadedcomic.description != null
                    ? loadedcomic.description
                    : 'No Description',
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CharactersGrid(),
          ],
        ),
      ),
    );
  }
}
