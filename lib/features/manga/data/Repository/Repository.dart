import 'package:anime_app/features/manga/data/model/PopularManag.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parse;

import '../model/NewAdded.dart';
import '../model/OurNewReleases.dart';

class RepositoryManga {
  Dio dio = Dio();

//!=============================popular manga=============================
  Future<List<PopularManga>> getManga() async {
    const url = "https://aresmanga.net/";
    var data = await dio.get(url);
    List<PopularManga> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      //list manag
      final listManga =
          html.querySelector('.listupd')!.children.forEach((element) {
        //link
        final link = element.querySelector('.bs .bsx a')!.attributes['href'];
        //title
        final title = element.querySelector('.bs .bsx a')!.attributes['title'];
        //cover
        final cover =
            element.querySelector('.bs .bsx a .limit img')!.attributes['src'];
        //chapter
        final chapter =
            element.querySelector('.bs .bsx a .bigor .adds .epxs')!.text;
        //rating
        final rating = element
            .querySelector('.bs .bsx a .bigor .adds .rt .rating .numscore')!
            .text;
        //add the data
        listData.add(PopularManga(
          chapter: chapter,
          link: link,
          rating: double.parse(rating),
          title: title,
          cover: cover,
        ));
      });
    }

    return listData;
  }

  //method of detail manga

  Future<List<PopularMangaDetail>> getMangaDetail({required String url}) async {
    var data = await dio.get(url);
    List<PopularMangaDetail> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      //list of chapter
      final listChapter =
          html.querySelector('#chapterlist ul')!.children.forEach((element) {
        //chapter number
        final chapterNumberindex = element.attributes['data-num'];
        //chapter links
        final chapterLinks =
            element.querySelector('.chbox .eph-num a')!.attributes['href'];
        //chapter number
        final chapterNumber =
            element.querySelector('.chbox .eph-num a .chapternum')!.text;
        //chapter date
        final chapterDate =
            element.querySelector('.chbox .eph-num a .chapterdate')!.text;
        //add the data to list
        listData.add(PopularMangaDetail(
          chapterDate: chapterDate,
          chapterLinks: chapterLinks,
          chapterNumber: chapterNumber,
          chapterNumberIndex: chapterNumberindex,
        ));
        //print some data test

        // print(element.querySelector('.chbox .eph-num a .chapterdate')!.text);
      });
    }
    return listData;
  }

//method of image manga
  Future<List<String>> getMangaDetailImage({required String url}) async {
    var data = await dio.get(url);
    List<String> imageList = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      final listmanga = html.querySelector('#readerarea')!;
      //list of image
      final h = listmanga.querySelectorAll('img');
      for (var element in h) {
        //src image
        final imageSrc = element.attributes['src'];
        //add image to list
        imageList.add(imageSrc!);
      }
    }
    return imageList;
  }

  //!===============================new added===================================
  Future<List<NewAdded>> getNewAdded() async {
    const url = "https://aresmanga.net/";
    var data = await dio.get(url);
    List<NewAdded> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      final mangaList = html
          .querySelector('.postbody')!
          .querySelectorAll('.bixbox')[1]
          .querySelector('.listupd')!
          .children
          .forEach((element) {
        //link
        final link = element.querySelector('div .bsx a')!.attributes['href'];
        //title
        final title = element.querySelector('div .bsx a')!.attributes['title'];
        //cover
        final cover =
            element.querySelector('div .bsx a .limit img')!.attributes['src'];
        //chapter
        final chapter =
            element.querySelector('div .bsx a .bigor .adds .epxs')!.text;
        //chapter Date
        final chapterDate =
            element.querySelector('div .bsx a .bigor .adds .epxdate')!.text;

        //add the data
        listData.add(NewAdded(
          chapter: chapter,
          link: link,
          title: title,
          cover: cover,
          date: chapterDate,
        ));
      });
    }
    return listData;
  }

  //!===============================new added===================================
  Future<List<OurNewReleases>> getOurNewReleases() async {
    const url = "https://aresmanga.net/";
    var data = await dio.get(url);
    List<OurNewReleases> listData = [];
    if (data.statusCode == 200) {
      final html = parse.parse(data.data);
      final mangaList = html
          .querySelector('.postbody')!
          .querySelectorAll('.bixbox')[0]
          .querySelector('.listupd')!
          .children
          .forEach((element) {
        //link
        if (element.className != 'hpage') {
          final link = element.querySelector('div .bsx a')!.attributes['href'];
          //cover
          final cover =
              element.querySelector('div .bsx a .limit img')!.attributes['src'];
          // title
          final title = element
              .querySelector('div .bsx .bigor .tt a')!
              .attributes['title'];

          //=============
          // first Number Chapter
          final firstNumberChapter = element
              .querySelector('div .bsx .bigor .chfiv ')!
              .querySelectorAll('li')[0]
              .querySelector('a')!
              .text;
          // first Number Chapter
          final firstNumberChapterLink = element
              .querySelector('div .bsx .bigor .chfiv ')!
              .querySelectorAll('li')[0]
              .querySelector('a')!
              .attributes['href'];
          // first Number Chapter
          final firstNumberChapterTime = element
              .querySelector('div .bsx .bigor .chfiv ')!
              .querySelectorAll('li')[0]
              .querySelector('span')!
              .text;
          //=============
          // first Number Chapter
          final secondNumberChapter = element
              .querySelector('div .bsx .bigor .chfiv ')!
              .querySelectorAll('li')[1]
              .querySelector('a')!
              .text;
          // first Number Chapter
          final secondNumberChapterLink = element
              .querySelector('div .bsx .bigor .chfiv ')!
              .querySelectorAll('li')[1]
              .querySelector('a')!
              .attributes['href'];
          // first Number Chapter
          final secondNumberChapterTime = element
              .querySelector('div .bsx .bigor .chfiv ')!
              .querySelectorAll('li')[1]
              .querySelector('span')!
              .text;
          //
          listData.add(OurNewReleases(
            cover: cover,
            firstNumberChapter: firstNumberChapter,
            firstNumberChapterLink: firstNumberChapterLink,
            firstNumberChapterTime: firstNumberChapterTime,
            link: link,
            secondNumberChapter: secondNumberChapter,
            secondNumberChapterLink: secondNumberChapterLink,
            secondNumberChapterTime: secondNumberChapterTime,
            title: title,
          ));
        }
      });
    }
    return listData;
  }
}
