import './character.dart';

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> characters;

  Data({this.offset, this.limit, this.total, this.count, this.characters});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Character> chars = new List<Character>();
    if (json['results'] != null) {
      json['results'].forEach((v) {
        chars.add(new Character.fromJson(v));
      });
    }

    return Data(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      characters: chars,
    );
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
