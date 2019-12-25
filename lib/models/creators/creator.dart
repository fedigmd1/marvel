import 'package:marvel/crypto/thumbnail.dart';

class Creator {
  int id;
  String fullName;
  String description;
  Thumbnail thumbnail;

  Creator({
    this.id,
    this.fullName,
    this.description,
    this.thumbnail,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
        id: json['id'],
        fullName: json['fullName'],
        description: json['description'],
        thumbnail: json['thumbnail'] != null
            ? Thumbnail.fromJson(json['thumbnail'])
            : null);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['description'] = this.description;
    return data;
  }
}

