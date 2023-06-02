class AnimeStaff {
  List<Data>? data;

  AnimeStaff.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  Person? person;
  List<String>? positions;

  Data.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    positions = json['positions'].cast<String>();
  }
}

class Person {
  int? malId;
  String? url;
  Images? images;
  String? name;

  Person.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
  }
}

class Images {
  Jpg? jpg;

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }
}

class Jpg {
  String? imageUrl;

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }
}
