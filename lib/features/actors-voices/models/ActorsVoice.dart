class ActorsVoice {
  List<Data>? data;

  ActorsVoice.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? role;
  Anime? anime;
  Character? character;

  Data.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    anime = json['anime'] != null ? Anime.fromJson(json['anime']) : null;
    character = json['character'] != null
        ? Character.fromJson(json['character'])
        : null;
  }
}

class Anime {
  int? malId;
  String? url;
  Images? images;
  String? title;

  Anime.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
  }
}

class Images {
  Jpg2? jpg;
  Jpg? webp;

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg2?.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Jpg.fromJson(json['webp']) : null;
  }
}

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }
}

class Character {
  int? malId;
  String? url;
  Images? images;
  String? name;

  Character.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
  }
}

class Jpg2 {
  String? imageUrl;

  Jpg2.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }
}

class Webp {
  String? imageUrl;
  String? smallImageUrl;

  Webp.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
  }
}
