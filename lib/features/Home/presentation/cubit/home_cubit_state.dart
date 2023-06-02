part of 'home_cubit_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object> get props => [];
}

class HomeCubitInitial extends HomeCubitState {}

class TranslateState extends HomeCubitState {
  String? result;
  TranslateState({this.result});
}

//!===========================full detail anime===========================================
class GetAllAnimeDataDetailLoadingState extends HomeCubitState {}

class GetAllAnimeDataDetailSuccessState extends HomeCubitState {}

class GetAllAnimeDataDetailErrorState extends HomeCubitState {}

//!===========================full data home===========================================
//full data home
class GetDataHomeLoadingState extends HomeCubitState {}

class GetDataHomeSuccessState extends HomeCubitState {}

class GetDataHomeErrorState extends HomeCubitState {}

//=============================state anime info detail=================================
//get anime overview
class GetAnimeOverviewLoadingState extends HomeCubitState {}

class GetAnimeOverviewSuccessState extends HomeCubitState {}

class GetAnimeOverviewErrorState extends HomeCubitState {}

//get anime news
class GetAnimeNewsLoadingState extends HomeCubitState {}

class GetAnimeNewsSuccessState extends HomeCubitState {}

class GetAnimeNewsErrorState extends HomeCubitState {}

//get anime Recommended
class GetAnimeRecommendedLoadingState extends HomeCubitState {}

class GetAnimeRecommendedSuccessState extends HomeCubitState {}

class GetAnimeRecommendedErrorState extends HomeCubitState {}



//get anime youtube video
class GetAnimeYoutubeVideoLoadingState extends HomeCubitState {}

class GetAnimeYoutubeVideoSuccessState extends HomeCubitState {}

class GetAnimeYoutubeVideoErrorState extends HomeCubitState {}

//=========================================================================================
//anime staff

class GetAnimeStaffLoadingState extends HomeCubitState {}

class GetAnimeStaffSuccessState extends HomeCubitState {}

class GetAnimeStaffErrorState extends HomeCubitState {}

//data Review state
class GetAllDataReviewState extends HomeCubitState {}

class GetAllDataReviewLoadingState extends HomeCubitState {}

class GetAllDataReviewErrorState extends HomeCubitState {}

//data Review Detailed state
class GetAllDataReviewDetailedState extends HomeCubitState {}

class GetAllDataReviewDetailedLoadingState extends HomeCubitState {}

class GetAllDataReviewDetailedErrorState extends HomeCubitState {}

//==============DB HELPER===================
class AddFavoriteState extends HomeCubitState {}
class GetFavoriteState extends HomeCubitState {}
//=========internet checker===================
class NoConnectedState extends HomeCubitState {}
class ConnectedState extends HomeCubitState {}
