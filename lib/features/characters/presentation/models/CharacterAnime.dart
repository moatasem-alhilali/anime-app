class CharacterAnime {
  List<Data>? data;

  CharacterAnime({this.data});

  CharacterAnime.fromJson(Map<String, dynamic> json) {
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

  Data({this.role, this.anime});

  Data.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    anime = json['anime'] != null ? Anime.fromJson(json['anime']) : null;
  }
}

class Anime {
  int? malId;
  String? url;
  Images? images;
  String? title;

  Anime({this.malId, this.url, this.images, this.title});

  Anime.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
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
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }
}
