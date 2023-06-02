class DataFullModel {
  DataFull? data;

  DataFullModel({this.data});

  DataFullModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataFull.fromJson(json['data']) : null;
  }
}

class DataFull {
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
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  List<Producers>? producers;
  List<Producers>? licensors;
  List<Producers>? studios;
  List<Producers>? genres;
  List<Relations>? relations;

  DataFull.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'] as int;
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
    title = json['title'] ?? '';
    titleEnglish = json['title_english'] ?? '';
    titleJapanese = json['title_japanese'] ?? '';
    type = json['type'] ?? '';
    source = json['source'] ?? '';
    episodes = json['episodes'] ?? 0;
    status = json['status'] ?? '';
    airing = json['airing'] ?? '';
    aired = json['aired'] != null ? Aired.fromJson(json['aired']) : null;
    duration = json['duration'] ?? '';
    rating = json['rating'] ?? '';
    popularity = json['popularity'] ?? 0;
    members = json['members'] ?? 0;
    favorites = json['favorites'] ?? 0;
    synopsis = json['synopsis'] ?? '';
    if (json['producers'] != null) {
      producers = <Producers>[];
      json['producers'].forEach((v) {
        producers!.add(Producers.fromJson(v));
      });
    }
    if (json['licensors'] != null) {
      licensors = <Producers>[];
      json['licensors'].forEach((v) {
        licensors!.add(Producers.fromJson(v));
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
    if (json['relations'] != null) {
      relations = <Relations>[];
      json['relations'].forEach((v) {
        relations!.add(Relations.fromJson(v));
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
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

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

  Titles({this.type, this.title});

  Titles.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    return data;
  }
}

class Aired {
  String? from;
  Prop? prop;
  String? string;

  Aired.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    prop = json['prop'] != null ? Prop.fromJson(json['prop']) : null;
    string = json['string'];
  }
}

class Prop {
  From? from;

  Prop.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? From.fromJson(json['from']) : null;
  }
}

class From {
  int? day;
  int? month;
  int? year;

  From({this.day, this.month, this.year});

  From.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }
}

class Producers {
  int? malId;
  String? type;
  String? name;
  String? url;

  Producers({this.malId, this.type, this.name, this.url});

  Producers.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
}

class Relations {
  String? relation;
  List<Entry>? entry;

  Relations({this.relation, this.entry});

  Relations.fromJson(Map<String, dynamic> json) {
    relation = json['relation'];
    if (json['entry'] != null) {
      entry = <Entry>[];
      json['entry'].forEach((v) {
        entry!.add(Entry.fromJson(v));
      });
    }
  }
}

class Entry {
  int? malId;
  String? type;
  String? name;
  String? url;

  Entry.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
}
