import 'package:dio/dio.dart';
import 'package:weather_app/config/constants.dart';
import 'package:weather_app/core/params/forecast_params.dart';

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

  Future<dynamic>sendRequest7DaysForecast(ForecastParams params) async{
    var response = await _dio
        .get('${Constants.BASE_URL}data/2.5/onecall',
        queryParameters: {

          "lat":params.lat,
          "lon":params.lon,
          "exclude":'minutely,hourly',
          "appid":_apiKey,
          "units":"metric"
        });

    return response;
  }
}
