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
  final url1 = Constraints.baseUrl + 'comics/&{id}/characters';
  final itemsPerPage = 30;
  var page = 0;
  var offset = 0;
  var lastTotalReturnedItems = 0;
  var searchTerm = "";
  List<Character> _items = [];

  List<Character> get items {
    return [..._items];
  }

  Future<void> getCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash =
        Md5().execute(timestamp + Keys.privateKey + Keys.publicKey).toString();

    try {
     
      if (items.isEmpty) {
      final String url = url1+'?'+'limit=50'+'&ts='+timestamp+'&apikey='+Keys.publicKey+'&hash='+hash;
      final response = await http.get(url);
      final data=json.decode(response.body);
      final extractedData = CharactersResponse.fromJson(data);
      _items=extractedData.data.characters;
      notifyListeners();
      }
     
    } catch (error) {
      print("An error has occuried: " + error.toString());
      throw (error);
    }
  }
}
