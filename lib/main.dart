import 'package:flutter/material.dart';
import './screens/characters_screen.dart';
import './screens/comics_screen.dart';
import './screens/creators_screen.dart';
import './screens/events_screen.dart';
import './screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
      routes: {
        CharactersScreen.routeName: (ctx) => CharactersScreen(),
        ComicsScreen.routeName: (ctx) => ComicsScreen(),
        CreatorsScreen.routeName: (ctx) => CreatorsScreen(),
        EventsScreen.routeName: (ctx) => EventsScreen(),
      },
    );
  }
}
