part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

//
class CharactersInitial extends CharactersState {}

class GetAllCharactersDataLoadingState extends CharactersState {}

class GetAllCharactersDataSuccessState extends CharactersState {}

class GetAllCharactersDataErrorState extends CharactersState {}

//

class TranslateCharactersState extends CharactersState {
  String? result;
  TranslateCharactersState({this.result});
}

//
class GetCharactersDataLoadingState extends CharactersState {}

class GetCharactersDataSuccessState extends CharactersState {}

class GetCharactersDataErrorState extends CharactersState {}

//anime Characters
class GetAnimeCharactersDataLoadingState extends CharactersState {}

class GetAnimeCharactersDataSuccessState extends CharactersState {}

class GetAnimeCharactersDataErrorState extends CharactersState {}

//Voice Characters
class GetVoiceCharactersDataLoadingState extends CharactersState {}

class GetVoiceCharactersDataSuccessState extends CharactersState {}

class GetVoiceCharactersDataErrorState extends CharactersState {}
//Pictures Characters
class GetPicturesCharactersDataLoadingState extends CharactersState {}

class GetPicturesCharactersDataSuccessState extends CharactersState {}

class GetPicturesCharactersDataErrorState extends CharactersState {}
