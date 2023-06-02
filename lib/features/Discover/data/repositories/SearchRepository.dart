import 'package:anime_app/core/dio_helper.dart';
import 'package:anime_app/features/Discover/data/models/SearchActors.dart';
import 'package:anime_app/features/Discover/data/models/SearchCharacter.dart';
import 'package:anime_app/features/Discover/data/models/SearchImageData.dart';
import 'package:anime_app/features/Discover/data/models/search.dart';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

XFile? fileImage;

class SearchRepository {
  //upload image
  Future<SearchImageData> SearchByImage() async {
    fileImage = null;
    Dio dio = Dio();
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    fileImage = await _picker.pickImage(source: ImageSource.gallery);
    String fileName = fileImage!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "url": await MultipartFile.fromFile(fileImage!.path, filename: fileName),
    });
    var response =
        await dio.post("https://api.trace.moe/search", data: formData);
    return SearchImageData.fromJson(response.data);
  }

//=============================search============================
//search For Anime
  Future<SearchModel> searchForAnime({required String q}) async {
    var data = await DioHelper.getData(url: '/anime', data: {'q': q});
    return SearchModel.fromJson(data.data);
  }

  //search For actors
  Future<SearchActors> searchForActors({required String q}) async {
    var data = await DioHelper.getData(url: '/people', data: {'q': q});
    return SearchActors.fromJson(data.data);
  }

  //search For actors
  Future<SearchCharacter> searchForCharacter({required String q}) async {
    var data = await DioHelper.getData(url: '/characters', data: {'q': q});
    return SearchCharacter.fromJson(data.data);
  }
}
