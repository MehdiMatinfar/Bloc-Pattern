import 'package:dio/dio.dart';
import 'package:weather_app/config/constants.dart';

class ApiProvider {
  final Dio _dio =  Dio();
  final _apiKey = Constants.API_KEY;

  Future<dynamic> callCurrentWeatherApi(String cityName) async {
    var response = await _dio
        .get('${Constants.BASE_URL}data/2.5/weather',
        queryParameters: {

          "q":cityName,
          "appid":_apiKey,
          "units":"metric"
    });

    return response;
  }
}
