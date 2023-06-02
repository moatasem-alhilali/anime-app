class FavoriteAnime {
  int? id;
  String? title;
  int? anime_id;
  String? image;

  FavoriteAnime({
    this.id,
    this.title,
    this.anime_id,
    this.image,
  });

  FavoriteAnime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    anime_id = json['anime_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'anime_id': anime_id,
      'image': image,
    };
  }
}
