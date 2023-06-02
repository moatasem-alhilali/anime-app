class FullCharacterModel {
  Data? data;

  FullCharacterModel({this.data});

  FullCharacterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? malId;
  String? url;
  Images? images;
  String? name;
  String? nameKanji;
  List<String>? nicknames;
  int? favorites;
  String? about;
  List<Anime>? anime;
  List<Manga>? manga;
  List<Voices>? voices;

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
    nameKanji = json['name_kanji'];
    nicknames = json['nicknames'].cast<String>();
    favorites = json['favorites'];
    about = json['about'];
    if (json['anime'] != null) {
      anime = <Anime>[];
      json['anime'].forEach((v) {
        anime!.add(Anime.fromJson(v));
      });
    }
    if (json['manga'] != null) {
      manga = <Manga>[];
      json['manga'].forEach((v) {
        manga!.add(Manga.fromJson(v));
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
  Jpg? webp;

  Images({this.jpg, this.webp});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Jpg.fromJson(json['webp']) : null;
  }
}

class Jpg {
  String? imageUrl;

  Jpg({this.imageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
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

class Anime {
  String? role;
  Anime2? anime;


  Anime.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    anime = json['anime'] != null ? Anime2.fromJson(json['anime']) : null;
  }
}

class Anime2 {
  int? malId;
  String? url;
  Images? images;
  String? title;


  Anime2.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
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

class Manga {
  String? role;
  Anime? manga;

  Manga({this.role, this.manga});

  Manga.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    manga = json['manga'] != null ? Anime.fromJson(json['manga']) : null;
  }
}

class Voices {
  Person? person;
  String? language;

  Voices({this.person, this.language});

  Voices.fromJson(Map<String, dynamic> json) {
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
    language = json['language'];
  }
}

class Person {
  int? malId;
  String? url;
  Images2? images;
  String? name;


  Person.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images2.fromJson(json['images']) : null;
    name = json['name'];
  }
}

class Images2 {
  Jpg? jpg;

  Images2.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }
}
