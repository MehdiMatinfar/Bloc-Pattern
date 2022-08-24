import 'package:dio/dio.dart';
import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'dart:async';
import 'package:weather_app/features/weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/weather/data/model/current_city_model.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/data/model/forecast_7days_model.dart';

import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/weather/domain/entity/forecast_7days_entity.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {

  ApiProvider? apiProvider;


  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName) async{
    try {
      Response response= await apiProvider!.callCurrentWeatherApi(cityName);

      if (response.statusCode==200) {

        CurrentCityEntity cityEntity = CurrentCityModel.fromJson(response.data);
        return  DataStateSuccessfully(data: cityEntity);
      }
      return  DataStateError(error: "Wrong ... Try Again.");

    }
    catch (e) {
      return  DataStateError(error: "Wrong ... Try Again.");

    }
  }

  @override
  Future<DataState<Forecast7DaysEntity>> fetchForecast7DaysData(ForecastParams params)async {

    try {
      Response response= await apiProvider!.sendRequest7DaysForecast(params);

      if (response.statusCode==200) {

        Forecast7DaysEntity forecast7daysEntity = Forecast7DaysModel.fromJson(response.data);
        return  DataStateSuccessfully(data: forecast7daysEntity);
      }
      return  DataStateError(error: "Wrong ... Try Again.");

    }
    catch (e) {
      return  DataStateError(error: "Wrong ... Try Again.");

    }
  }



}