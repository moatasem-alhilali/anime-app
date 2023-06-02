class SessionsAnimeNow {
  List<Data>? data;

  SessionsAnimeNow.fromJson(Map<String, dynamic> json) {
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
  String? url;
  Images? images;
  Trailer? trailer;
  bool? approved;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  String? duration;
  String? rating;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? season;
  int? year;

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    approved = json['approved'];

    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];

    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    duration = json['duration'];
    rating = json['rating'];
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    season = json['season'];
    year = json['year'];
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
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }
}

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;

  Trailer.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'];
    url = json['url'];
    embedUrl = json['embed_url'];
  }
}
