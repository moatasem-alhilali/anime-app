import 'package:anime_app/core/dio_helper.dart';
import 'package:anime_app/features/Home/data/models/AnimeNews.dart';
import 'package:anime_app/features/Home/data/models/AnimeOverview.dart';
import 'package:anime_app/features/Home/data/models/AnimeRecommended.dart';
import 'package:anime_app/features/Home/data/models/AnimeStaff.dart';
import 'package:anime_app/features/Home/data/models/AnimeYoutubeVideo.dart';
import 'package:anime_app/features/Home/data/models/TopAnimeModel.dart';
import 'package:anime_app/features/Home/data/models/animeDetailFull.dart';
import 'package:anime_app/features/favorite/data/model/FavoriteAnime.dart';
import 'package:anime_app/features/favorite/data/repositories/DBHELPER.dart';

class AnimeRepository {
  final url = "/anime/41467/reviews";

  //!===================anime detail=========================

  //anime overView
  Future<AnimeOverview> getAnimeReview({required int id}) async {
    final data = await DioHelper.getData(url: '/anime/$id/reviews');
    return AnimeOverview.fromJson(data.data);
  }

  // Anime Staff
  Future<AnimeStaff> getAnimeStaff({required int id}) async {
    final data = await DioHelper.getData(url: '/anime/$id/staff');
    return AnimeStaff.fromJson(data.data);
  }

  //anime news
  Future<AnimeNews> getAnimeNews({required int id}) async {
    final data = await DioHelper.getData(url: '/anime/$id/news');
    return AnimeNews.fromJson(data.data);
  }

  //anime recommendations
  Future<AnimeRecommended> getAnimeRecommended({required int id}) async {
    final data = await DioHelper.getData(url: '/anime/$id/recommendations');
    return AnimeRecommended.fromJson(data.data);
  }

  //anime video youtube
  Future<AnimeYoutubeVideo> getAnimeYoutubeVideo({required int id}) async {
    final data = await DioHelper.getData(url: '/anime/$id/videos');
    return AnimeYoutubeVideo.fromJson(data.data);
  }
  //getFullAnime

  Future<DataFullModel> getFullAnime({required int id}) async {
    final data = await DioHelper.getData(url: '/anime/$id/full');
    return DataFullModel.fromJson(data.data);
  }

  //!===============================Home===========================================
  Future<TopAnimeModel> getTopAnime() async {
    final data = await DioHelper.getData(url: '/top/anime');
    return TopAnimeModel.fromJson(data.data);
  }

  //=======================DB HELPER===========================
  Future<List<FavoriteAnime>> getFavorite() async {
    List<FavoriteAnime> ListData = [];
    var data = await DBHelperFavorite.getAllData();
    data.forEach((element) {
      ListData.add(FavoriteAnime.fromJson(element));
    });
    return ListData;
  }

//
  Future<int> addToFavorite({required FavoriteAnime favoriteAnime}) async {
    var data = await DBHelperFavorite.addNote(favoriteAnime);

    return data;
  }

  Future<int> deleteFavorite({required FavoriteAnime favoriteAnime}) async {
    var data = await DBHelperFavorite.deleteAnime(favoriteAnime);

    return data;
  }
}
