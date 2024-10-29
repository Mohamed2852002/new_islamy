import 'package:dio/dio.dart';
import 'package:new_islamy/models/radio_model.dart';
import 'package:new_islamy/models/reciter_model.dart';

class RadioService {
  final Dio dio = Dio();
  Future<List<RadioModel>> getRadio() async {
    try {
      final response =
          await dio.get('https://mp3quran.net/api/v3/radios?language=ar');
      List<RadioModel> models = [];
      for (var i = 0; i < response.data["radios"].length; i++) {
        models.add(RadioModel.radioFromJson(response.data, i));
      }
      return models;
    } on DioException catch (e) {
      final String? errorMessage = e.message;
      throw Exception(errorMessage);
    }
  }

  Future<List<ReciterModel>> getReciter(int reciterNumber) async {
    try {
      final response = await dio.get(
          'https://api.quran.com/api/v4/chapter_recitations/$reciterNumber');
      List<ReciterModel> models = [];
      for (var i = 0; i < 114; i++) {
        models.add(ReciterModel.fromjson(response.data, i));
      }
      return models;
    } on DioException catch (e) {
      final String? errorMessage = e.message;
      throw Exception(errorMessage);
    }
  }
}
