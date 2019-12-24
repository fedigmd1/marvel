import '../../models/thumbnail.dart';

class Comic {
  int id;
  String title;
  String description;
  Thumbnail thumbnail;

  Comic({
    this.id,
    this.title,
    this.description,
    this.thumbnail,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
