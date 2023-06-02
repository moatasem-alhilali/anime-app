part of 'manga_cubit.dart';

abstract class MangaState extends Equatable {
  const MangaState();

  @override
  List<Object> get props => [];
}

class MangaInitial extends MangaState {}

//data manga home
class GetDataMangaHomeLoadingState extends MangaState {}

class GetDataMangaHomeSuccessState extends MangaState {}

class GetDataMangaHomeErrorState extends MangaState {}

//data manga detail
class GetDataMangaDetailLoadingState extends MangaState {}

class GetDataMangaDetailSuccessState extends MangaState {}

class GetDataMangaDetailErrorState extends MangaState {}

//data manga image
class GetDataMangaImageLoadingState extends MangaState {}

class GetDataMangaImageSuccessState extends MangaState {}

class GetDataMangaImageErrorState extends MangaState {}
