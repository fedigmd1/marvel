import './comic.dart';

class DataComic {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> comics;

  DataComic({this.offset, this.limit, this.total, this.count, this.comics});

  factory DataComic.fromJson(Map<String, dynamic> json) {
    List<Comic> chars = new List<Comic>();
    if (json['results'] != null) {
      json['results'].forEach((v) {
        chars.add(new Comic.fromJson(v));
      });
    }

    return DataComic(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      comics: chars,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.comics != null) {
      data['results'] = this.comics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
