import 'package:marvel/models/characters/character.dart';

class DataCharcter {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> characters;

  DataCharcter({this.offset, this.limit, this.total, this.count, this.characters});

  DataCharcter.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      characters = new List<Character>();
      json['results'].forEach((v) {
        characters.add(new Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.characters != null) {
      data['results'] = this.characters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}