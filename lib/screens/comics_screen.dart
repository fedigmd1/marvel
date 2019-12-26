import 'package:flutter/material.dart';
//import 'package:marvel/screens/character_detail_screen.dart';
import 'package:marvel/widgets/comics_grid.dart';
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ComicsGrid(),
    );
  }
}
