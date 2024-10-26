import 'package:dio/dio.dart';
import 'package:new_islamy/models/pray_time_model.dart';

class PrayTimeService {
  final Dio dio = Dio();
  final DateTime now = DateTime.now();

  Future<PrayTimeModel> getPrayTime() async {
    try {
      final response = await dio.get(
          'https://api.aladhan.com/v1/timingsByCity/${now.day}-${now.month}-${now.year}?city=cairo&country=egypt');
      PrayTimeModel prayTimeModel = PrayTimeModel.fromJson(response.data);

      return prayTimeModel;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
