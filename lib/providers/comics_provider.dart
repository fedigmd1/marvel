
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel/crypto/crypto/keys.dart';
import 'package:marvel/crypto/crypto/md5.dart';
import 'package:marvel/models/comics/comic.dart';
import 'package:marvel/crypto/crypto/constraints.dart';
import 'package:marvel/models/comics/comics_response.dart';

class ComicsProviders with ChangeNotifier {
  final url1 = Constraints.baseUrl + 'comics';
  final itemsPerPage = 10;
  var page = 0;
  var offset = 0;
  var lastTotalReturnedItems = 0;
  var searchTerm = "";
  List<Comic> _items = [];

  List<Comic> get items {
    return [..._items];
  }

  Comic _selectedComic;

  Comic get selectedComic {
    return _selectedComic;
  }

  void selectComic(int index) {
    _selectedComic = _items[index];
    notifyListeners();
  }

  // Comic findById(String id) {
  //   return _items.firstWhere((comic) => comic.id == id);
  // }

  Comic findById(String id) {
    return _items.firstWhere((comic) => '${comic.id}' == id);
  }

  Future<void> getComics() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash =
        Md5().execute(timestamp + Keys.privateKey + Keys.publicKey).toString();

    try {
      // offset = (page * itemsPerPage);
      // Map<String, dynamic> queryParameters = {
      //   "apikey": Keys.publicKey,
      //   "hash": hash,
      //   "ts": timestamp,
      //   "limit": itemsPerPage.toString(),
      //   "offset": offset.toString()
      // };
      if (items.isEmpty) {
        final String url = url1 +
            '?' +
            'limit=20' +
            '&ts=' +
            timestamp +
            '&apikey=' +
            Keys.publicKey +
            '&hash=' +
            hash;
        final response = await http.get(url);
        final data = json.decode(response.body);
        final extractedData = ComicsResponse.fromJson(data);
        _items = extractedData.data.comics;
        notifyListeners();
      }

      //final extractedData = DataComic.fromJson(value);

      // final List<Comic> loadedComics = [];
      // extractedData.forEach((comicId, comicData) {
      //   loadedComics.add(Comic(
      //     id: int.parse(comicId),
      //     title: comicData['title'],
      //     description: comicData['description'],
      //     thumbnail: comicData['thumbnail'],
      //   ));
      // });
      // _items = loadedComics;
      //notifyListeners();
    } catch (error) {
      print("An error has occuried: " + error.toString());
      throw (error);
    }
  }
}
