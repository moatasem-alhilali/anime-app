import 'package:anime_app/features/session/logic/Repository/Repository.dart';
import 'package:anime_app/features/session/model/SessionUpcoming.dart';
import 'package:anime_app/features/session/model/SessionsAnime.dart';
import 'package:anime_app/features/session/model/SessionsAnimeNow.dart';
import 'package:anime_app/features/session/model/SessionsData.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit({required this.sessionRepository}) : super(SessionInitial());
  //Repository
  SessionRepository sessionRepository;
  //object
  static SessionCubit get(context) => BlocProvider.of(context);

  //data
  SessionsDataModel? sessionsDataModel;
  SessionsAnimeNow? sessionsAnimeNow;
  SessionsAnime? sessionsAnime;
  SessionUpComing? sessionUpComing;

  void getSessionAllData() async {
    sessionsDataModel = null;
    sessionsAnimeNow = null;
    sessionUpComing = null;
    emit(GetSessionLoadingState());
    try {
      //
      var data = await sessionRepository.getSessionList();
      sessionsDataModel = data;
      //
      var data2 = await sessionRepository.getSessionsAnimeNow();
      sessionsAnimeNow = data2;
      print(data2.data![0].title);
      //
      var data3 = await sessionRepository.getSessionUpComing();
      sessionUpComing = data3;
      //
      emit(GetSessionSuccessState());
    } catch (e) {
      print(e.toString());

      emit(GetSessionErrorState());
    }
  }

  void getAnimeSession({
    required String session,
    required int year,
  }) async {
    sessionsAnime = null;
    emit(GetAnimeSessionLoadingState());

    try {
      //
      var data =
          await sessionRepository.getAnimeSession(session: session, year: year);
      sessionsAnime = data;
      emit(GetAnimeSessionSuccessState());
    } catch (e) {
      print(e.toString());

      emit(GetAnimeSessionErrorState());
    }
  }
}
