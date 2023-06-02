import 'dart:convert';

class SessionUpComing {
  List<Data>? data;

  SessionUpComing.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? malId;
  Images? images;
  String? title;

  Data.fromJson(Map<String, dynamic> jsons) {
    malId = jsons['mal_id'];
    images = jsons['images'] != null ? Images.fromJson(jsons['images']) : null;

    title = jsons['title'];
  }
}

class Images {
  Jpg? jpg;
  Jpg? webp;

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Jpg.fromJson(json['webp']) : null;
  }
}

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'] ?? '';
    smallImageUrl = json['small_image_url'] ?? '';
    largeImageUrl = json['large_image_url'] ?? '';
  }
}
