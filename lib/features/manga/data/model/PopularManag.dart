class PopularManga {
  String? link;
  String? title;
  double? rating;
  String? chapter;
  String? cover;
  PopularManga({this.chapter, this.link, this.rating, this.title, this.cover});
}

//==============================================
class PopularMangaDetail {
  String? chapterNumberIndex;
  String? chapterLinks;
  String? chapterNumber;
  String? chapterDate;
  PopularMangaDetail({
    this.chapterDate,
    this.chapterLinks,
    this.chapterNumber,
    this.chapterNumberIndex,
  });
}
