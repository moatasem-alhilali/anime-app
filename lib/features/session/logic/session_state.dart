part of 'session_cubit.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionState {}

//Get session
class GetSessionLoadingState extends SessionState {}

class GetSessionSuccessState extends SessionState {}

class GetSessionErrorState extends SessionState {}

//Get Anime session
class GetAnimeSessionLoadingState extends SessionState {}

class GetAnimeSessionSuccessState extends SessionState {}

class GetAnimeSessionErrorState extends SessionState {}
