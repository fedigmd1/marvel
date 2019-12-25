import './event.dart';

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Event> events;

  Data({this.offset, this.limit, this.total, this.count, this.events});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Event> chars = new List<Event>();
    if (json['results'] != null) {
      json['results'].forEach((v) {
        chars.add(new Event.fromJson(v));
      });
    }

    return Data(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      events: chars,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.events != null) {
      data['results'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
