import 'package:anime_app/features/manga/data/Repository/Repository.dart';
import 'package:anime_app/features/manga/data/model/NewAdded.dart';
import 'package:anime_app/features/manga/data/model/OurNewReleases.dart';
import 'package:anime_app/features/manga/data/model/PopularManag.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manga_state.dart';

class MangaCubit extends Cubit<MangaState> {
  //repository instant
  RepositoryManga repositoryManga;
  MangaCubit({required this.repositoryManga}) : super(MangaInitial());
  //object
  static MangaCubit get(context) => BlocProvider.of(context);
  //data
  List<PopularManga> popularManga = [];
  List<PopularMangaDetail> popularMangaDetail = [];
  List<String> mangaImage = [];
  List<NewAdded> dataNewAdded = [];
  List<OurNewReleases> dataOurNewReleases = [];

  //=========================method========================
  void getDataMangaHome() async {
    popularManga = [];
    dataOurNewReleases = [];
    dataNewAdded = [];
    emit(GetDataMangaHomeLoadingState());
    try {
      //
      final data = await repositoryManga.getManga();
      popularManga = data;
      print('one');
      //
      final data2 = await repositoryManga.getNewAdded();
      dataNewAdded = data2;
      print('tow');
      //
      final data3 = await repositoryManga.getOurNewReleases();
      dataOurNewReleases = data3;
      print('three');
      emit(GetDataMangaHomeSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetDataMangaHomeErrorState());
    }
  }

  void getDataMangaDetail({required String url}) async {
    popularMangaDetail = [];
    emit(GetDataMangaDetailLoadingState());
    try {
      final data = await repositoryManga.getMangaDetail(url: url);
      popularMangaDetail = data;
      emit(GetDataMangaDetailSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetDataMangaDetailErrorState());
    }
  }

  void getDataMangaImage({required String url}) async {
    mangaImage = [];
    emit(GetDataMangaDetailLoadingState());
    try {
      final data = await repositoryManga.getMangaDetailImage(url: url);
      mangaImage = data;
      emit(GetDataMangaDetailSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetDataMangaDetailErrorState());
    }
  }
}
