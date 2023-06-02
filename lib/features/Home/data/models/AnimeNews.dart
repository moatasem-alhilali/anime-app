class AnimeNews {
  Pagination? pagination;
  List<Data>? data;

  AnimeNews.fromJson(Map<String, dynamic> json) {
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

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'] ?? "";
    hasNextPage = json['has_next_page'] ?? "";
  }
}

class Data {
  int? malId;
  String? url;
  String? title;
  String? date;
  String? authorUsername;
  String? authorUrl;
  String? forumUrl;
  Images? images;
  int? comments;
  String? excerpt;

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'] ?? "";
    url = json['url'] ?? "";
    title = json['title'] ?? "";
    date = json['date'] ?? "";
    authorUsername = json['author_username'] ?? "";
    authorUrl = json['author_url'] ?? "";
    forumUrl = json['forum_url'] ?? "";
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    comments = json['comments'] ?? "";
    excerpt = json['excerpt'] ?? "";
  }
}

class Images {
  Jpg? jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }
}

class Jpg {
  String? imageUrl;

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'] ?? "";
  }
}
