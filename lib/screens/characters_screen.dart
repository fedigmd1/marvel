import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:marvel/providers/characters_provider.dart';

class CharactersScreen extends StatefulWidget {
  static const routeName = '/characters';

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
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
      dataExtracted.getCharacters().then((_) {
        setState(() {
          _isLoading = false;
          data = dataExtracted.items;
          print(data);
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Marvel'),
          ],
        ),
      ),
      body: Container(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : InkWell(
                child: Container(
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, i) => Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 200,
                                  child: Image.network(
                                      '${data[i].thumbnail.path}.${data[i].thumbnail.extension}')),
                              // Image.network('${data[i].thumbnail}'),

                              Container(
                                child: Text('${data[i].name}'),
                              ),
                            ],
                          ),

                          //data[i].imageUrl,
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
