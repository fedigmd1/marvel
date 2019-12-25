import './creator.dart';


class DataCreator {
  int offset;
  int limit;
  int total;
  int count;
  List<Creator> creators;

  DataCreator({this.offset, this.limit, this.total, this.count, this.creators});

  factory DataCreator.fromJson(Map<String, dynamic> json) {
    List<Creator> chars = new List<Creator>();
    if (json['results'] != null) {
      json['results'].forEach((v) {
        chars.add(new Creator.fromJson(v));
      });
    }

    return DataCreator(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      creators: chars,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.creators != null) {
      data['results'] = this.creators.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
