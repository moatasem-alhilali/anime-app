import 'dart:async';

import 'package:anime_app/core/constant.dart';
import 'package:anime_app/features/Home/data/models/AnimeStaff.dart';
import 'package:anime_app/features/Home/data/repositories/AnimeRepository.dart';
import 'package:anime_app/features/Home/data/models/AnimeNews.dart';
import 'package:anime_app/features/Home/data/models/AnimeOverview.dart';
import 'package:anime_app/features/Home/data/models/AnimeRecommended.dart';
import 'package:anime_app/features/Home/data/models/AnimeRelations.dart';
import 'package:anime_app/features/Home/data/models/AnimeYoutubeVideo.dart';
import 'package:anime_app/features/Home/data/models/TopAnimeModel.dart';
import 'package:anime_app/features/Home/data/models/animeDetailFull.dart';
import 'package:anime_app/features/favorite/data/model/FavoriteAnime.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  //rep
  AnimeRepository animeRepository;
  HomeCubit({required this.animeRepository}) : super(HomeCubitInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  TopAnimeModel? topAnimeModel;
  DataFullModel? animeDetailFull;
  AnimeOverview? animeOverview;
  AnimeNews? animeNews;
  AnimeRecommended? animeRecommended;
  AnimeRelations? animeRelations;
  AnimeYoutubeVideo? animeYoutubeVideo;
  AnimeStaff? animeStaff;
  int current = 0;
  //favorite Anime
  List<FavoriteAnime> favoriteAnime = [];

  void translate(String text) {
    text.translate(from: 'auto', to: 'ar').then((value) {
      emit(TranslateState(result: value.text));
    });
  }

//!=====================================anime info detail======================================

  void getAllAnimeDetail({required int id}) async {
    animeDetailFull = null;
    animeYoutubeVideo = null;

    emit(GetAllAnimeDataDetailLoadingState());
    try {
      final data = await animeRepository.getAnimeYoutubeVideo(id: id);
      animeYoutubeVideo = data;
      final data5 = await animeRepository.getFullAnime(id: id);
      animeDetailFull = data5;
      print('get All Anime Detail');

      emit(GetAllAnimeDataDetailSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetAllAnimeDataDetailErrorState());
    }
  }

//anime overView
  void getAnimeReview({required int id}) async {
    animeOverview = null;
    emit(GetAnimeOverviewLoadingState());
    try {
      final data = await animeRepository.getAnimeReview(id: id);
      animeOverview = data;
      emit(GetAnimeOverviewSuccessState());
    } catch (e) {
      print(e.toString());

      emit(GetAnimeOverviewErrorState());
    }
  }

//anime news
  void getAnimeNews({required int id}) async {
    emit(GetAnimeNewsLoadingState());
    animeNews = null;
    try {
      final data = await animeRepository.getAnimeNews(id: id);
      animeNews = data;
      emit(GetAnimeNewsSuccessState());
    } catch (e) {
      print(e.toString());

      emit(GetAnimeNewsErrorState());
    }
  }

  //anime Recommended
  void getAnimeRecommended({required int id}) async {
    animeRecommended = null;
    emit(GetAnimeRecommendedLoadingState());
    try {
      final data = await animeRepository.getAnimeRecommended(id: id);
      animeRecommended = data;
      emit(GetAnimeNewsSuccessState());
    } catch (e) {
      print(e.toString());

      emit(GetAnimeNewsErrorState());
    }
  }

//================================== Home Data =======================================

  void getDataHome() async {
    topAnimeModel = null;

    emit(GetDataHomeLoadingState());

    try {
      var data2 = await animeRepository.getFavorite();
      favoriteAnime = data2;

      var data = await animeRepository.getTopAnime();
      topAnimeModel = data;
      print('one');

      emit(GetDataHomeSuccessState());
    } catch (e) {
      emit(GetDataHomeErrorState());
      print(e);
    }
  }
  //

  void getStatistics({required int id}) {
    try {} catch (e) {}
  }

//
  void getAnimeStaff({required int id}) async {
    animeStaff = null;
    emit(GetAnimeStaffLoadingState());
    try {
      var data = await animeRepository.getAnimeStaff(id: id);
      animeStaff = data;
      print('one');
      emit(GetAnimeStaffSuccessState());
    } catch (e) {
      emit(GetAnimeStaffErrorState());
    }
  }

  //======================DB HELPER==========================

  //event
  void getFavorite() async {
    favoriteAnime = [];
    try {
      var data = await animeRepository.getFavorite();
      favoriteAnime = data;
      emit(GetFavoriteState());
    } catch (e) {
      print(e);
    }
  }

  Future<int> addToFavorite({
    required String title,
    required int anime_id,
    required String image,
  }) async {
    FavoriteAnime favoriteAnime =
        FavoriteAnime(anime_id: anime_id, title: title, image: image);
    int? result = 0;
    try {
      getFavorite();
      emit(AddFavoriteState());
      final number =
          await animeRepository.addToFavorite(favoriteAnime: favoriteAnime);
      result = number;
    } catch (e) {
      print(e);
    }
    return result!;
  }

  void deleteFavoriteAnime({required FavoriteAnime favoriteAnime}) async {
    try {
      final data =
          await animeRepository.deleteFavorite(favoriteAnime: favoriteAnime);
      getFavorite();
    } catch (e) {
      print(e);
    }
  }

  //==================internet checker=====================
  StreamSubscription? _subscription;
  //
  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        CONFECTED = true;
        getDataHome();
        emit(ConnectedState());
      } else {
        CONFECTED = false;

        emit(NoConnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
