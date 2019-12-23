import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Marvel'),
            Container(
              height: 20,
              width: 10,
              child: Image.asset('assets/images/marvelAppBar.png'),
            )
          ],
        ),
      ),
      body: Image.asset('assets/images/marvel.jpg'),
    );
  }
}
