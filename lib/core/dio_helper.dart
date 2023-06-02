import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.jikan.moe/v4',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response<dynamic>> getData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio!.get(url, queryParameters: data);
  }
}
