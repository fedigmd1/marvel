import 'package:flutter/material.dart';
import 'package:marvel/providers/characters_provider.dart';
import 'package:marvel/providers/comics_provider.dart';
import 'package:marvel/screens/comic_detail_screen.dart';
import 'package:marvel/screens/comics_screen.dart';
import 'package:provider/provider.dart';
import './screens/character_detail_screen.dart';
import './screens/creators_screen.dart';
import './screens/events_screen.dart';
import './screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          // builder: (ctx) => ProductsProviders(),
          value: ComicsProviders(),
        ),
        ChangeNotifierProvider.value(
          value: CharactersProviders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
        routes: {
          ComicsScreen.routeName: (ctx) => ComicsScreen(),
          CreatorsScreen.routeName: (ctx) => CreatorsScreen(),
          EventsScreen.routeName: (ctx) => EventsScreen(),
          ComicDetailScreen.routeName: (ctx) => ComicDetailScreen(),
          CharacterDetailScreen.routeName: (ctx) => CharacterDetailScreen(),
        },
      ),
    );
  }
}
