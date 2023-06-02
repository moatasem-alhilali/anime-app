class AnimeRecommended {
  List<Data>? data;

  AnimeRecommended({this.data});

  AnimeRecommended.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Entry? entry;
  String? url;
  int? votes;

  Data({this.entry, this.url, this.votes});

  Data.fromJson(Map<String, dynamic> json) {
    entry = json['entry'] != null ? new Entry.fromJson(json['entry']) : null;
    url = json['url'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entry != null) {
      data['entry'] = this.entry!.toJson();
    }
    data['url'] = this.url;
    data['votes'] = this.votes;
    return data;
  }
}

class Entry {
  int? malId;
  String? url;
  Images? images;
  String? title;

  Entry({this.malId, this.url, this.images, this.title});

  Entry.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}

class Images {
  Jpg? jpg;
  Jpg? webp;

  Images({this.jpg, this.webp});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? new Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? new Jpg.fromJson(json['webp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jpg != null) {
      data['jpg'] = this.jpg!.toJson();
    }
    if (this.webp != null) {
      data['webp'] = this.webp!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['small_image_url'] = this.smallImageUrl;
    data['large_image_url'] = this.largeImageUrl;
    return data;
  }
}
