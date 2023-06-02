import 'package:anime_app/core/dio_helper.dart';
import 'package:anime_app/features/session/model/SessionUpcoming.dart';
import 'package:anime_app/features/session/model/SessionsAnime.dart';
import 'package:anime_app/features/session/model/SessionsAnimeNow.dart';
import 'package:anime_app/features/session/model/SessionsData.dart';

class SessionRepository {
  Future<SessionsDataModel> getSessionList() async {
    final data = await DioHelper.getData(url: '/seasons');
    return SessionsDataModel.fromJson(data.data);
  }

  Future<SessionsAnimeNow> getSessionsAnimeNow() async {
    final data = await DioHelper.getData(url: '/seasons/now');
    return SessionsAnimeNow.fromJson(data.data);
  }

  Future<SessionsAnime> getAnimeSession(
      {required int year, required String session}) async {
    final data = await DioHelper.getData(url: '/seasons/$year/$session');
    return SessionsAnime.fromJson(data.data);
  }

  Future<SessionUpComing> getSessionUpComing() async {
    final data = await DioHelper.getData(url: '/seasons/upcoming');
    return SessionUpComing.fromJson(data.data);
  }
}
