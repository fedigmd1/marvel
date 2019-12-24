import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  static const routeName = '/charcters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Marvel'),
        ),
        body: Center(
          child: Text('hello'),
        ));
  }
}
