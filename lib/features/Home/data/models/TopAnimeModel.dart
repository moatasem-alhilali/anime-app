class TopAnimeModel {
  Pagination? pagination;
  List<Data>? data;

  TopAnimeModel({this.pagination, this.data});

  TopAnimeModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination(
      {this.lastVisiblePage, this.hasNextPage, this.currentPage, this.items});

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
    currentPage = json['current_page'];
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['last_visible_page'] = lastVisiblePage;
    data['has_next_page'] = hasNextPage;
    data['current_page'] = currentPage;
    if (items != null) {
      data['items'] = items!.toJson();
    }
    return data;
  }
}

class Items {
  int? count;
  int? total;
  int? perPage;

  Items({this.count, this.total, this.perPage});

  Items.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['total'] = total;
    data['per_page'] = perPage;
    return data;
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
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Producers>? producers;
  List<Producers>? licensors;
  List<Producers>? studios;
  List<Producers>? genres;
  List<Producers>? demographics;

  Data(
      {this.malId,
      this.url,
      this.images,
      this.trailer,
      this.approved,
      this.titles,
      this.title,
      this.titleEnglish,
      this.titleJapanese,
      this.titleSynonyms,
      this.type,
      this.source,
      this.episodes,
      this.status,
      this.airing,
      this.aired,
      this.duration,
      this.rating,
      this.score,
      this.scoredBy,
      this.rank,
      this.popularity,
      this.members,
      this.favorites,
      this.synopsis,
      this.background,
      this.season,
      this.year,
      this.broadcast,
      this.producers,
      this.licensors,
      this.studios,
      this.genres,
      this.demographics});

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
    titleSynonyms = json['title_synonyms'].cast<String>();
    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    aired = json['aired'] != null ? Aired.fromJson(json['aired']) : null;
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'];
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    background = json['background'];
    season = json['season'];
    year = json['year'];
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
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
    if (json['demographics'] != null) {
      demographics = <Producers>[];
      json['demographics'].forEach((v) {
        demographics!.add(Producers.fromJson(v));
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

  Trailer({this.youtubeId, this.url, this.embedUrl, this.images});

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

  ImagesTrailer(
      {this.imageUrl,
      this.smallImageUrl,
      this.mediumImageUrl,
      this.largeImageUrl,
      this.maximumImageUrl});

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
}

class Aired {
  String? from;
  String? to;
  Prop? prop;
  String? string;

  Aired({this.from, this.to, this.prop, this.string});

  Aired.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    prop = json['prop'] != null ? Prop.fromJson(json['prop']) : null;
    string = json['string'];
  }
}

class Prop {
  From? from;
  From? to;

  Prop({this.from, this.to});

  Prop.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? From.fromJson(json['from']) : null;
    to = json['to'] != null ? From.fromJson(json['to']) : null;
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

class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

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

  Producers({this.malId, this.type, this.name, this.url});

  Producers.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
}
