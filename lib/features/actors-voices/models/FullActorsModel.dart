class FullActorsModel {
  Data? data;

  FullActorsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? malId;
  String? url;
  String? websiteUrl;
  Images? images;
  String? name;
  String? givenName;
  String? familyName;
  List<String>? alternateNames;
  String? birthday;
  int? favorites;
  String? about;
  List<Anime>? anime;
  List<Voices>? voices;

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    websiteUrl = json['website_url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
    givenName = json['given_name'];
    familyName = json['family_name'];
    alternateNames = json['alternate_names'].cast<String>();
    birthday = json['birthday'];
    favorites = json['favorites'];
    about = json['about'];
    if (json['anime'] != null) {
      anime = <Anime>[];
      json['anime'].forEach((v) {
        anime!.add(Anime.fromJson(v));
      });
    }

    if (json['voices'] != null) {
      voices = <Voices>[];
      json['voices'].forEach((v) {
        voices!.add(Voices.fromJson(v));
      });
    }
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

class Anime {
  String? position;
  Anime2? anime;

  Anime.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    anime = json['anime'] != null ? Anime2.fromJson(json['anime']) : null;
  }
}

class Anime2 {
  int? malId;
  String? url;
  Images2? images;
  String? title;

  Anime2.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images2.fromJson(json['images']) : null;
    title = json['title'];
  }
}

class Images2 {
  Jpg? jpg;
  Jpg2? webp;

  Images2.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Jpg2.fromJson(json['webp']) : null;
  }
}

class Jpg2 {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg2.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }
}

class Voices {
  String? role;
  Anime? anime;
  Character? character;

  Voices({this.role, this.anime, this.character});

  Voices.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    anime = json['anime'] != null ? Anime.fromJson(json['anime']) : null;
    character = json['character'] != null
        ? Character.fromJson(json['character'])
        : null;
  }
}

class Character {
  int? malId;
  String? url;
  Images? images;
  String? name;

  Character({this.malId, this.url, this.images, this.name});

  Character.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
  }
}

class Webp {
  String? imageUrl;
  String? smallImageUrl;

  Webp({this.imageUrl, this.smallImageUrl});

  Webp.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
  }
}
