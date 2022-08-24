import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/weather/domain/entity/forecast_7days_entity.dart';

abstract class WeatherRepository{

  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);
  Future<DataState<Forecast7DaysEntity>> fetchForecast7DaysData(ForecastParams params);

}