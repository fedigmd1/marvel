import 'package:marvel/models/comics/comic.dart';

class DataComic {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> comics;

  DataComic({this.offset, this.limit, this.total, this.count, this.comics});

  DataComic.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      comics = new List<Comic>();
      json['results'].forEach((v) {
        comics.add(new Comic.fromJson(v));
      });
    }
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