class TopPoeple {
  Pagination? pagination;
  List<Data>? data;

  TopPoeple({this.pagination, this.data});

  TopPoeple.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;

  Pagination({this.lastVisiblePage, this.hasNextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
  }
}

class Data {
  int? malId;
  String? url;
  String? websiteUrl;
  Images? images;
  String? name;
  String? givenName;
  String? familyName;
  List<String>? alternateNames;
  String? birthday;
  int? favorites;
  String? about;

  Data(
      {this.malId,
      this.url,
      this.websiteUrl,
      this.images,
      this.name,
      this.givenName,
      this.familyName,
      this.alternateNames,
      this.birthday,
      this.favorites,
      this.about});

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    websiteUrl = json['website_url'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    name = json['name'];
    givenName = json['given_name'];
    familyName = json['family_name'];
    alternateNames = json['alternate_names'].cast<String>();
    birthday = json['birthday'];
    favorites = json['favorites'];
    about = json['about'];
  }
}

class Images {
  Jpg? jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? new Jpg.fromJson(json['jpg']) : null;
  }
}

class Jpg {
  String? imageUrl;

  Jpg({this.imageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }
}
