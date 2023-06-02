part of 'news_scrap_cubit.dart';

abstract class NewsScrapState extends Equatable {
  const NewsScrapState();

  @override
  List<Object> get props => [];
}

class NewsScrapInitial extends NewsScrapState {}

//get new scrape
class GetNewsScrapeLoadingState extends NewsScrapState {}

class GetNewsScrapeSuccessState extends NewsScrapState {}

class GetNewsScrapeErrorState extends NewsScrapState {}

//get new  scrape detail
class GetNewsScrapeDetailLoadingState extends NewsScrapState {}

class GetNewsScrapeDetailSuccessState extends NewsScrapState {}

class GetNewsScrapeDetailErrorState extends NewsScrapState {}
