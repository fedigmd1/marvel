//import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel/crypto/crypto/keys.dart';
import 'package:marvel/crypto/crypto/md5.dart';
import 'package:marvel/models/characters/character.dart';
import 'package:marvel/models/characters/characters_response.dart';
import 'package:marvel/crypto/crypto/constraints.dart';

class CharactersProviders with ChangeNotifier {
  // String _id = "";
  //final url1 = Constraints.baseUrl + 'comics/$_id/characters';
  // final itemsPerPage = 30;
  // var page = 0;
  // var offset = 0;
  // var lastTotalReturnedItems = 0;
  // var searchTerm = "";
  List<Character> _items = [];

  List<Character> get items {
    return [..._items];
  }

  Character findById(String id) {
    return _items.firstWhere((character) => '${character.id}' == id);
  }

  // void setComicId(String id) {
  //   _id = id;
  //   notifyListeners();
  // }

  Character _selectedCharacter;

  Character get selectedCharacter {
    return _selectedCharacter;
  }

  void selectCharcters(int index) {
    _selectedCharacter = _items[index];
    notifyListeners();
  }

  Future<void> getcomicCharacters(String idComic) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash =
        Md5().execute(timestamp + Keys.privateKey + Keys.publicKey).toString();
    if (idComic != "" && idComic != null) {
      try {
        final String url = Constraints.baseUrl +
            'comics/$idComic/characters' +
            '?' +
            'limit=30' +
            '&ts=' +
            timestamp +
            '&apikey=' +
            Keys.publicKey +
            '&hash=' +
            hash;
        final response = await http.get(url);
        final data = json.decode(response.body);
        final extractedData = CharactersResponse.fromJson(data);
        _items = extractedData.data.characters;
        notifyListeners();
      } catch (error) {
        print("An error has occuried: " + error.toString());
        throw (error);
      }
    }
  }
}
