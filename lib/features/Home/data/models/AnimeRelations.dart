class AnimeRelations {
  List<Data>? data;

  AnimeRelations({this.data});

  AnimeRelations.fromJson(Map<String, dynamic> json) {
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
  String? relation;
  List<Entry>? entry;

  Data({this.relation, this.entry});

  Data.fromJson(Map<String, dynamic> json) {
    relation = json['relation'];
    if (json['entry'] != null) {
      entry = <Entry>[];
      json['entry'].forEach((v) {
        entry!.add(new Entry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relation'] = this.relation;
    if (this.entry != null) {
      data['entry'] = this.entry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entry {
  int? malId;
  String? type;
  String? name;
  String? url;

  Entry({this.malId, this.type, this.name, this.url});

  Entry.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
