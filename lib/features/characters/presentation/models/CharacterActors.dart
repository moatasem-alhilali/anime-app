class CharacterActors {
  List<Data>? data;

  CharacterActors({this.data});

  CharacterActors.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? language;
  Person? person;

  Data({this.language, this.person});

  Data.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
  }
}

class Person {
  int? malId;
  String? url;
  Images? images;
  String? name;

  Person({this.malId, this.url, this.images, this.name});

  Person.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    name = json['name'];
  }
}

class Images {
  Jpg? jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? new Jpg.fromJson(json['jpg']) : null;
  }
}

class Jpg {
  String? imageUrl;

  Jpg({this.imageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }
}
