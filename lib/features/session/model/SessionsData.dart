class SessionsDataModel {
  Pagination? pagination;
  List<Data>? data;

  SessionsDataModel.fromJson(Map<String, dynamic> json) {
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
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
  }
}

class Data {
  int? year;
  List<String>? seasons;

  Data.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    seasons = json['seasons'].cast<String>();
  }
}
