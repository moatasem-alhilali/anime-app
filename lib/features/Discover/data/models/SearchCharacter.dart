class SearchCharacter {
  Pagination? pagination;
  List<Data>? data;

  SearchCharacter.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? nameKanji;
  List<String>? nicknames;
  int? favorites;
  String? about;

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
    nameKanji = json['name_kanji'];
    nicknames = json['nicknames'].cast<String>();
    favorites = json['favorites'];
    about = json['about'];
  }
}

class Images {
  Jpg? jpg;
  Webp? webp;

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Webp.fromJson(json['webp']) : null;
  }
}

class Jpg {
  String? imageUrl;

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
