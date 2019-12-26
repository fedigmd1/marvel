import 'package:marvel/models/comics/data_comic.dart';

class ComicsResponse {
  DataComic data;

  ComicsResponse({this.data});

  ComicsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataComic.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}