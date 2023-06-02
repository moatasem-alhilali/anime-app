class AnimeOverview {
  Pagination? pagination;
  List<Data>? data;

  AnimeOverview({this.pagination, this.data});

  AnimeOverview.fromJson(Map<String, dynamic> json) {
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

  Pagination({this.lastVisiblePage, this.hasNextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['last_visible_page'] = lastVisiblePage;
    data['has_next_page'] = hasNextPage;
    return data;
  }
}

class Data {
  int? malId;
  String? url;
  String? type;
  Reactions? reactions;
  String? date;
  String? review;
  int? score;
  List<String>? tags;
  bool? isSpoiler;
  bool? isPreliminary;
  Null? episodesWatched;
  User? user;

  Data(
      {this.malId,
      this.url,
      this.type,
      this.reactions,
      this.date,
      this.review,
      this.score,
      this.tags,
      this.isSpoiler,
      this.isPreliminary,
      this.episodesWatched,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    type = json['type'];
    reactions = json['reactions'] != null
        ? Reactions.fromJson(json['reactions'])
        : null;
    date = json['date'];
    review = json['review'];
    score = json['score'];
    tags = json['tags'].cast<String>();
    isSpoiler = json['is_spoiler'];
    isPreliminary = json['is_preliminary'];
    episodesWatched = json['episodes_watched'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mal_id'] = malId;
    data['url'] = url;
    data['type'] = type;
    if (reactions != null) {
      data['reactions'] = reactions!.toJson();
    }
    data['date'] = date;
    data['review'] = review;
    data['score'] = score;
    data['tags'] = tags;
    data['is_spoiler'] = isSpoiler;
    data['is_preliminary'] = isPreliminary;
    data['episodes_watched'] = episodesWatched;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Reactions {
  int? overall;
  int? nice;
  int? loveIt;
  int? funny;
  int? confusing;
  int? informative;
  int? wellWritten;
  int? creative;

  Reactions(
      {this.overall,
      this.nice,
      this.loveIt,
      this.funny,
      this.confusing,
      this.informative,
      this.wellWritten,
      this.creative});

  Reactions.fromJson(Map<String, dynamic> json) {
    overall = json['overall'];
    nice = json['nice'];
    loveIt = json['love_it'];
    funny = json['funny'];
    confusing = json['confusing'];
    informative = json['informative'];
    wellWritten = json['well_written'];
    creative = json['creative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['overall'] = overall;
    data['nice'] = nice;
    data['love_it'] = loveIt;
    data['funny'] = funny;
    data['confusing'] = confusing;
    data['informative'] = informative;
    data['well_written'] = wellWritten;
    data['creative'] = creative;
    return data;
  }
}

class User {
  String? url;
  String? username;
  Images? images;

  User({this.url, this.username, this.images});

  User.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    username = json['username'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['username'] = username;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    return data;
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
