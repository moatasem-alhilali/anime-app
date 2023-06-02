class AnimeYoutubeVideo {
  Data? data;

  AnimeYoutubeVideo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Promo>? promo;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['promo'] != null) {
      promo = <Promo>[];
      json['promo'].forEach((v) {
        promo!.add(Promo.fromJson(v));
      });
    }
  }
}

class Promo {
  String? title;
  Trailer? trailer;

  Promo.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? '';
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
  }
}

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  Images? images;

  Trailer.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'] ?? '';
    url = json['url'] ?? '';
    embedUrl = json['embed_url'] ?? '';
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }
}

class Images {
  String? imageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? maximumImageUrl;

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'] ?? '';
    smallImageUrl = json['small_image_url'] ?? '';
    mediumImageUrl = json['medium_image_url'] ?? '';
    largeImageUrl = json['large_image_url'] ?? '';
    maximumImageUrl = json['maximum_image_url'] ?? '';
  }
}
