import 'package:marvel/models/characters/data_character.dart';

class CharactersResponse {
  DataCharcter data;

  CharactersResponse({this.data});

  CharactersResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataCharcter.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}