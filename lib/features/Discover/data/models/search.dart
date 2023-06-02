class SearchModel {
  Pagination? pagination;
  List<Data>? data;

  SearchModel({this.pagination, this.data});

  SearchModel.fromJson(dynamic json) {
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
}

class Data {
  int? malId;
  String? url;
  Images? images;
  bool? approved;
  List<Titles>? titles;
  String? title;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  List<Producers>? producers;
  List<Producers>? licensors;
  List<Producers>? studios;
  List<Producers>? genres;

  Data(
      {this.malId,
      this.url,
      this.images,
      this.approved,
      this.titles,
      this.title,
      this.titleJapanese,
      this.titleSynonyms,
      this.type,
      this.source,
      this.episodes,
      this.status,
      this.airing,
      this.duration,
      this.rating,
      this.score,
      this.scoredBy,
      this.rank,
      this.popularity,
      this.members,
      this.favorites,
      this.synopsis,
      this.producers,
      this.licensors,
      this.studios,
      this.genres});

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    approved = json['approved'];
    if (json['titles'] != null) {
      titles = <Titles>[];
      json['titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    title = json['title'];
    titleJapanese = json['title_japanese'];
    titleSynonyms = json['title_synonyms'].cast<String>();
    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'];
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];

    //producers
    if (json['producers'] != null) {
      producers = <Producers>[];
      json['producers'].forEach((v) {
        producers!.add(Producers.fromJson(v));
      });
    }
    //Licensors
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

class Titles {
  String? type;
  String? title;

  Titles({this.type, this.title});

  Titles.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
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
