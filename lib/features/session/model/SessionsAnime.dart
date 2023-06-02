class SessionsAnime {
  List<Data>? data;

  SessionsAnime.fromJson(Map<String, dynamic> json) {
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
  List<Titles>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  String? type;
  String? source;
  // int? episodes;
  String? status;
  bool? airing;
  String? duration;
  String? rating;
  // double? score;
  // int? scoredBy;
  // int? rank;
  // int? popularity;
  // int? members;
  // int? favorites;
  String? synopsis;
  String? season;
  // int? year;
  Broadcast? broadcast;
  List<Producers>? producers;
  List<Producers>? studios;
  List<Producers>? genres;
  List<Producers>? themes;

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    approved = json['approved'];
    if (json['titles'] != null) {
      titles = <Titles>[];
      json['titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    type = json['type'];
    source = json['source'];
    // episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    duration = json['duration'];
    rating = json['rating'];
    // score = json['score'];
    // scoredBy = json['scored_by'];
    // rank = json['rank'];
    // popularity = json['popularity'];
    // members = json['members'];
    // favorites = json['favorites'];
    synopsis = json['synopsis'];
    season = json['season'];
    // year = json['year'];
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
    if (json['producers'] != null) {
      producers = <Producers>[];
      json['producers'].forEach((v) {
        producers!.add(Producers.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      studios = <Producers>[];
      json['studios'].forEach((v) {
        studios!.add(Producers.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Producers>[];
      json['genres'].forEach((v) {
        genres!.add(Producers.fromJson(v));
      });
    }
    if (json['themes'] != null) {
      themes = <Producers>[];
      json['themes'].forEach((v) {
        themes!.add(Producers.fromJson(v));
      });
    }
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
  ImagesTrailer? images;

  Trailer.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'];
    url = json['url'];
    embedUrl = json['embed_url'];
    images =
        json['images'] != null ? ImagesTrailer.fromJson(json['images']) : null;
  }
}

class ImagesTrailer {
  String? imageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? maximumImageUrl;

  ImagesTrailer.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    maximumImageUrl = json['maximum_image_url'];
  }
}

class Titles {
  String? type;
  String? title;

  Titles.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
  }
}

class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    time = json['time'];
    timezone = json['timezone'];
    string = json['string'];
  }
}

class Producers {
  int? malId;
  String? type;
  String? name;
  String? url;

  Producers.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
}
