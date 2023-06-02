import 'package:anime_app/features/news/data/models/AnimeNews.dart';
import 'package:anime_app/features/news/data/repositories/Repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_scrap_state.dart';

class NewsScrapCubit extends Cubit<NewsScrapState> {
  RepositoryNews repositoryNews;
  NewsScrapCubit({required this.repositoryNews}) : super(NewsScrapInitial());
  //instant
  static NewsScrapCubit get(context) => BlocProvider.of(context);

  //data
  List<AnimeNewsScrap> newsScrapData = [];
  List<String> dataDetail = [];
  List<AnimeNewsScrap> animeNewsInfo = [];

  //event
  void getNewsScrap() async {
    newsScrapData = [];
    emit(GetNewsScrapeLoadingState());
    try {
      final data = await repositoryNews.getNews();
      newsScrapData = data;
      final data2 = await repositoryNews.getAnimeNewsInfo();
      animeNewsInfo = data2;
      emit(GetNewsScrapeSuccessState());
    } catch (e) {
      emit(GetNewsScrapeErrorState());
    }
  }

  void getNewsScrapDetail({required String link}) async {
    dataDetail = [];
    emit(GetNewsScrapeDetailLoadingState());
    try {
      final data = await repositoryNews.getNewsDetail(link: link);
      dataDetail = data;
      emit(GetNewsScrapeDetailSuccessState());
    } catch (e) {
      emit(GetNewsScrapeDetailErrorState());
    }
  }
}
