import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/FavoriteAnime.dart';
import '../../data/repositories/WatchRepository.dart';

part 'watch_anime_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteRepository favoriteRepository;
  FavoriteCubit({required this.favoriteRepository})
      : super(WatchAnimeInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
//data
  List<FavoriteAnime> favoriteAnime = [];

  //event
  void getFavorite() async {
    try {
      var data = await favoriteRepository.getFavorite();
      favoriteAnime = data;
      emit(GetFavoriteState());
    } catch (e) {
      print(e);
    }
  }

  void addToFavorite({
    required String title,
    required int anime_id,
    required String image,
  }) async {
    FavoriteAnime favoriteAnime =
        FavoriteAnime(anime_id: anime_id, title: title, image: image);
    try {
      var data =
          await favoriteRepository.addToFavorite(favoriteAnime: favoriteAnime);
      emit(AddToFavoriteState());
    } catch (e) {
      print(e);
    }
  }
}
