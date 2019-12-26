import 'package:flutter/material.dart';
import 'package:marvel/screens/characters_screen.dart';
import 'package:provider/provider.dart';

import 'package:marvel/providers/comics_provider.dart';

class ComicsScreen extends StatefulWidget {
  static const routeName = '/comics';

  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  var _isInit = true;
  var _isLoading = false;
  var data = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final dataExtracted = Provider.of<ComicsProviders>(context);
      dataExtracted.getComics().then((_) {
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
      body: Stack(
        children: <Widget>[
          Container(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
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
                                          '${data[i].thumbnail.path}/portrait_medium.${data[i].thumbnail.extension}')),
                                  // Image.network('${data[i].thumbnail}'),

                                  Container(
                                    child: Text('${data[i].id}'),
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
          FlatButton(
            textColor: Colors.red,
            color: Colors.white,
            child: Text('Charcters'),
            onPressed: () => {
              Navigator.of(context).pushNamed(CharactersScreen.routeName),
            },
          ),
        ],
      ),
    );
  }
}
