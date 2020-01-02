import 'package:flutter/material.dart';
import 'package:marvel/screens/comics_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: <Widget>[
      //       Text('Marvel'),
      //     ],
      //   ),
      // ),
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.of(context).pushNamed(ComicsScreen.routeName);
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/marvelBack.jpg",
              fit: BoxFit.cover,
            ),
            // Text(
            //   'Double tap',
            //   style: TextStyle(
            //     fontSize: 26.0,
            //     fontWeight: FontWeight.bold,
            //     backgroundColor: Colors.blueAccent,
            //   ),
            // ),
          ],
        ),
      ),

      // Stack(
      //   alignment: Alignment.center,
      //   children: <Widget>[
      //     Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage("assets/images/marvelBack.jpg"),
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      //      //httphttp padding: EdgeInsets.only(left: 20),
      //       child: FlatButton(
      //         child: Text('data'),
      //         color: Colors.red[200],
      //         onPressed: () => {
      //           Navigator.of(context).pushNamed(ComicsScreen.routeName),
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      // body: Row(
      //   children: <Widget>[
      //     Container(
      //         child: Column(
      //       children: <Widget>[
      //         Image.asset(
      //           'assets/images/marvel.jpg',
      //           fit: BoxFit.fill,
      //           height: 552,
      //           width: 360,
      //         ),
      //         FlatButton(
      //           child: Text('data'),
      //           onPressed: () {},
      //         )
      //       ],
      //     )),
      //   ],
      // ),
    );
  }
}
