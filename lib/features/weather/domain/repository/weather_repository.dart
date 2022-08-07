import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';

abstract class WeatherRepository{

  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

}