import 'package:anime_app/core/dio_helper.dart';

import 'package:anime_app/features/actors-voices/models/TopPeopleModel.dart';
import 'package:anime_app/features/actors-voices/models/ActorsVoice.dart';
import 'package:anime_app/features/actors-voices/models/FullActorsModel.dart';
import 'package:anime_app/features/actors-voices/models/ActorsPictures.dart';

class ActorsRepository {
  final url = "/anime/41467/reviews";

  Future<TopPoeple> getTopPeople() async {
    final data = await DioHelper.getData(url: '/top/people');
    return TopPoeple.fromJson(data.data);
  }

  //!=================people data==============================
  Future<FullActorsModel> getFullActorsData({required int id}) async {
    final data = await DioHelper.getData(url: '/people/$id/full');
    return FullActorsModel.fromJson(data.data);
  }

  Future<ActorsPictures> getImagesActorsData({required int id}) async {
    final data = await DioHelper.getData(url: '/people/$id/pictures');
    return ActorsPictures.fromJson(data.data);
  }

  Future<ActorsVoice> getVoiceActorsData({required int id}) async {
    final data = await DioHelper.getData(url: '/people/$id/voices');
    return ActorsVoice.fromJson(data.data);
  }
}
