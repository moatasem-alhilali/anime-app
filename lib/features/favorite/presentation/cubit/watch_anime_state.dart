part of 'watch_anime_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class WatchAnimeInitial extends FavoriteState {}

class AddToFavoriteState extends FavoriteState {}

class GetFavoriteState extends FavoriteState {}
