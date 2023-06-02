class CharactersModel {
  Pagination? pagination;
  List<Data>? data;

  CharactersModel({this.pagination, this.data});

  CharactersModel.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
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
  String? name;
  String? nameKanji;
  List<String>? nicknames;
  int? favorites;
  String? about;

  Data(
      {this.malId,
      this.url,
      this.images,
      this.name,
      this.nameKanji,
      this.nicknames,
      this.favorites,
      this.about});

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images =
        json['images'] != null ? Images.fromJson(json['images']) : null;
    name = json['name'];
    nameKanji = json['name_kanji'];
    nicknames = json['nicknames'].cast<String>();
    favorites = json['favorites'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mal_id'] = malId;
    data['url'] = url;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['name'] = name;
    data['name_kanji'] = nameKanji;
    data['nicknames'] = nicknames;
    data['favorites'] = favorites;
    data['about'] = about;
    return data;
  }
}

class Images {
  Jpg? jpg;
  Webp? webp;

  Images({this.jpg, this.webp});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Webp.fromJson(json['webp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (jpg != null) {
      data['jpg'] = jpg!.toJson();
    }
    if (webp != null) {
      data['webp'] = webp!.toJson();
    }
    return data;
  }
}

class Jpg {
  String? imageUrl;

  Jpg({this.imageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image_url'] = imageUrl;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image_url'] = imageUrl;
    data['small_image_url'] = smallImageUrl;
    return data;
  }
}
