import 'package:bloc_breaking_bad/constants/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebService {
  late Dio dio;
  CharacterWebService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 60 * 1000,
      connectTimeout: 60 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
