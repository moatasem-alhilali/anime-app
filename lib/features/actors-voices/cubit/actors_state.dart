part of 'actors_cubit.dart';

abstract class ActorsState extends Equatable {
  const ActorsState();

  @override
  List<Object> get props => [];
}

class ActorsInitial extends ActorsState {}
class TranslateActorsState extends ActorsState {
  String? result;
  TranslateActorsState({this.result});
}
//
class GetActorsDataLoadingState extends ActorsState {}

class GetActorsDataSuccessState extends ActorsState {}

class GetActorsDataErrorState extends ActorsState {}

//Full Data state
class GetActorsFullDataLoadingState extends ActorsState {}

class GetActorsFullDataSuccessState extends ActorsState {}

class GetActorsFullDataErrorState extends ActorsState {}

// Voice actors state
class GetVoiceActorsLoadingState extends ActorsState {}

class GetVoiceActorsSuccessState extends ActorsState {}

class GetVoiceActorsErrorState extends ActorsState {}
//image actors state
class GetImageActorsLoadingState extends ActorsState {}

class GetImageActorsSuccessState extends ActorsState {}

class GetImageActorsErrorState extends ActorsState {}
