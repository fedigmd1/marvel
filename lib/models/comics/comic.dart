import 'package:marvel/crypto/thumbnail.dart';

class Comic {
  int id;
  String title;
  String description;
  String resourceURI;
  Thumbnail thumbnail;

  Comic(
      {this.id,
      this.title,
      this.description,
      this.resourceURI,
      this.thumbnail});

  Comic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}