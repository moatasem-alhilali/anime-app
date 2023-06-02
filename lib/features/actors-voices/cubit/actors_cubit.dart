import 'package:anime_app/features/actors-voices/models/TopPeopleModel.dart';
import 'package:anime_app/features/actors-voices/models/ActorsPictures.dart';
import 'package:anime_app/features/actors-voices/models/ActorsVoice.dart';
import 'package:anime_app/features/actors-voices/models/FullActorsModel.dart';
import 'package:anime_app/features/actors-voices/repositories/AnimeRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

part 'actors_state.dart';

class ActorsCubit extends Cubit<ActorsState> {
  ActorsRepository actorsRepository;
  ActorsCubit({required this.actorsRepository}) : super(ActorsInitial());
  static ActorsCubit get(context) => BlocProvider.of(context);

  //DATA
  TopPoeple? topPoeple;
  FullActorsModel? fullActorsModel;
  ActorsPictures? actorsPictures;
  ActorsVoice? actorsVoice;
  void translate(String text) {
    text.translate(from: 'auto', to: 'ar').then((value) {
      // value.text = text;
      emit(TranslateActorsState(result: value.text));
    });
  }

  //!get top actors
  void getTopActors() async {
    topPoeple = null;
    emit(GetActorsDataLoadingState());

    try {
      var data3 = await actorsRepository.getTopPeople();
      topPoeple = data3;
      print('three');
      emit(GetActorsDataSuccessState());
    } catch (e) {
      emit(GetActorsDataErrorState());
      print(e);
    }
  }

//get All Data Detail Actors
  void getAllDataDetailActors({required int id}) async {
    emit(GetActorsFullDataLoadingState());
    try {
      var data = await actorsRepository.getFullActorsData(id: id);
      fullActorsModel = data;
      print('one');

      emit(GetActorsFullDataSuccessState());
    } catch (e) {
      emit(GetActorsFullDataErrorState());
      print(e.toString());
    }
  }

//get Voice Actors Data
  void getVoiceActorsData({required int id}) async {
    actorsVoice = null;
    emit(GetVoiceActorsLoadingState());

    try {
      var data3 = await actorsRepository.getVoiceActorsData(id: id);
      actorsVoice = data3;
      print('get Voice Actors Data');
      emit(GetVoiceActorsSuccessState());
    } catch (e) {
      emit(GetVoiceActorsErrorState());
      print(e.toString());
    }
  }

  //get Images Actors Data
  void getImagesActorsData({required int id}) async {
    actorsPictures = null;
    emit(GetImageActorsLoadingState());
    try {
      //
      var data2 = await actorsRepository.getImagesActorsData(id: id);
      actorsPictures = data2;
      emit(GetImageActorsSuccessState());
      print('get Images Actors Data');
    } catch (e) {
      emit(GetImageActorsErrorState());
      print(e.toString());
    }
  }
}
