import 'package:anime_app/features/news/data/models/AnimeNews.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parse;

class RepositoryNews {
  Dio dio = Dio();

//!=============================getNews=============================
  Future<List<AnimeNewsScrap>> getNews() async {
    const url =
        "https://renovasyo.com/archives/category/كل-ما-يخص-اخبار-الانمي";
    var data = await dio.get(url);
    List<AnimeNewsScrap> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      final listNews = html
          .querySelector('.mg-posts-sec-inner')!
          .children
          .forEach((element) {
        if (element.className ==
            'col-md-12 text-center d-flex justify-content-center') {
        } else {
          //image
          final cover =
              element.querySelector('div .mg-post-thumb')!.attributes['style'];
          //link
          final link =
              element.querySelector('div .mg-post-thumb a')!.attributes['href'];
          //title
          final title = element.querySelector('.mg-sec-top-post h4 a')!.text;

          //date
          final date = element
              .querySelector('.mg-sec-top-post .mg-blog-meta span a')!
              .text;

          //content
          final content =
              element.querySelector('.mg-sec-top-post .mg-content p')!.text;
          listData.add(AnimeNewsScrap(
            content: content,
            cover: cover,
            date: date,
            link: link,
            title: title,
          ));
        }
      });
    }
    return listData;
  }

  Future<List<String>> getNewsDetail({required String link}) async {
    var data = await dio.get(link);
    List<String> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      final listOfContent = html
          .querySelector('.mg-blog-post-box article')!
          .querySelectorAll('p')
          .forEach((element) {
        //content
        final content = element.text;
        listData.add(content);
      });
    }
    return listData;
  }

  //!=============================anime information=============================
  Future<List<AnimeNewsScrap>> getAnimeNewsInfo() async {
    const url = "https://renovasyo.com/archives/category/لائحة-الانمي";
    var data = await dio.get(url);
    List<AnimeNewsScrap> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      final listNews = html
          .querySelector('.mg-posts-sec-inner')!
          .children
          .forEach((element) {
        //check the tag null data
        if (element.className !=
            'col-md-12 text-center d-flex justify-content-center') {
          //image
          final cover =
              element.querySelector('div .mg-post-thumb')!.attributes['style'];
          //link
          final link =
              element.querySelector('div .mg-post-thumb a')!.attributes['href'];
          //title
          final title = element.querySelector('.mg-sec-top-post h4 a')!.text;

          //date
          final date = element
              .querySelector('.mg-sec-top-post .mg-blog-meta span a')!
              .text;

          //content
          final content =
              element.querySelector('.mg-sec-top-post .mg-content p')!.text;
          listData.add(AnimeNewsScrap(
            content: content,
            cover: cover,
            date: date,
            link: link,
            title: title,
          ));
        }
      }); //end for each

    }
    return listData;
  }
}
