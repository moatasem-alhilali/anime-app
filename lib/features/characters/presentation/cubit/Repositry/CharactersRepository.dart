import 'package:anime_app/core/dio_helper.dart';
import 'package:anime_app/features/characters/presentation/models/Characters.dart';
import 'package:anime_app/features/characters/presentation/models/CharacterActors.dart';

import 'package:anime_app/features/characters/presentation/models/CharacterAnime.dart';
import 'package:anime_app/features/characters/presentation/models/CharacterPictures.dart';
import 'package:anime_app/features/characters/presentation/models/FullCharecterModel.dart';

class CharactersRepository {
  Future<CharactersModel> getTopCharacters() async {
    final data = await DioHelper.getData(url: '/top/characters');
    return CharactersModel.fromJson(data.data);
  }

  //
  Future<CharacterAnime> getDetailAnimeCharacters({required int id}) async {
    final data = await DioHelper.getData(url: '/characters/$id/anime');
    return CharacterAnime.fromJson(data.data);
  }

  Future<CharacterActors> getDetailCharactersVoices({required int id}) async {
    final data = await DioHelper.getData(url: '/characters/$id/voices');
    return CharacterActors.fromJson(data.data);
  }

  Future<CharacterPictures> getDetailCharactersPictures(
      {required int id}) async {
    final data = await DioHelper.getData(url: '/characters/$id/pictures');
    return CharacterPictures.fromJson(data.data);
  }

  Future<FullCharacterModel> getFullDetailCharacters({required int id}) async {
    final data = await DioHelper.getData(url: '/characters/$id/full');
    return FullCharacterModel.fromJson(data.data);
  }
}
