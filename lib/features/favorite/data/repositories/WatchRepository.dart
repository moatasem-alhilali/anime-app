import 'package:anime_app/features/favorite/data/model/FavoriteAnime.dart';
import 'package:anime_app/features/favorite/data/repositories/DBHELPER.dart';

class FavoriteRepository {
  Future<List<FavoriteAnime>> getFavorite() async {
    List<FavoriteAnime> ListData = [];
    var data = await DBHelperFavorite.getAllData();
    data.forEach((element) {
      ListData.add(FavoriteAnime.fromJson(element));
    });
    return ListData;
  }

  Future<int> addToFavorite({required FavoriteAnime favoriteAnime}) async {
    var data = await DBHelperFavorite.addNote(favoriteAnime);

    return data;
  }
}
