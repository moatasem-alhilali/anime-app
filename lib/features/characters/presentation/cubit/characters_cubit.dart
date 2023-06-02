import 'package:anime_app/features/characters/presentation/models/Characters.dart';
import 'package:anime_app/features/characters/presentation/cubit/Repositry/CharactersRepository.dart';
import 'package:anime_app/features/characters/presentation/models/CharacterActors.dart';
import 'package:anime_app/features/characters/presentation/models/CharacterAnime.dart';
import 'package:anime_app/features/characters/presentation/models/CharacterPictures.dart';
import 'package:anime_app/features/characters/presentation/models/FullCharecterModel.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersRepository charactersRepository;
  CharactersCubit({required this.charactersRepository})
      : super(CharactersInitial());

  static CharactersCubit get(context) => BlocProvider.of(context);
//data
  CharacterActors? characterActorsVoices;
  CharacterAnime? characterAnimes;
  CharacterPictures? characterPictures;
  FullCharacterModel? fullCharacterModel;
  //
  CharactersModel? charactersModel;

//method
//get top Character
  void getTopCharacter() async {
    charactersModel = null;
    emit(GetCharactersDataLoadingState());

    try {
      var data1 = await charactersRepository.getTopCharacters();
      charactersModel = data1;
      emit(GetCharactersDataSuccessState());
    } catch (e) {
      emit(GetCharactersDataErrorState());
      print(e);
    }
  }

  void getAllDataDetailCharacters({required int id}) async {
    fullCharacterModel = null;

    emit(GetAllCharactersDataLoadingState());
    try {
      final data = await charactersRepository.getFullDetailCharacters(id: id);
      fullCharacterModel = data;

      emit(GetAllCharactersDataSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetAllCharactersDataErrorState());
    }
  }

  //getDetailAnimeCharacters
  void getDetailAnimeCharacters({required int id}) async {
    emit(GetAnimeCharactersDataLoadingState());
    try {
      final data = await charactersRepository.getDetailAnimeCharacters(id: id);
      characterAnimes = data;
      emit(GetAnimeCharactersDataSuccessState());
    } catch (e) {
      emit(GetAnimeCharactersDataErrorState());
      print(e);
    }
  }

  //getDetailCharactersVoices
  void getDetailCharactersVoices({required int id}) async {
    emit(GetVoiceCharactersDataLoadingState());
    try {
      final data = await charactersRepository.getDetailCharactersVoices(id: id);
      characterActorsVoices = data;
      emit(GetVoiceCharactersDataSuccessState());
    } catch (e) {
      emit(GetVoiceCharactersDataErrorState());
      print(e);
    }
  }

//getDetailCharactersPictures
  void getDetailCharactersPictures({required int id}) async {
    emit(GetPicturesCharactersDataLoadingState());
    try {
      final data =
          await charactersRepository.getDetailCharactersPictures(id: id);
      characterPictures = data;
      emit(GetPicturesCharactersDataSuccessState());
      print('getDetailCharactersPictures');
    } catch (e) {
      emit(GetPicturesCharactersDataErrorState());
      print(e);
    }
  }

//translate data
  void translate(String text) {
    text.translate(from: 'auto', to: 'ar').then((value) {
      emit(TranslateCharactersState(result: value.text));
    });
  }
}
