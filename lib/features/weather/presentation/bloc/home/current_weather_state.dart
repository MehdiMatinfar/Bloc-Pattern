import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';

@immutable
abstract class CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}
class CurrentWeatherCompleted extends CurrentWeatherState {
  final CurrentCityEntity? currentCityEntity;

   CurrentWeatherCompleted(this.currentCityEntity);
}
class CurrentWeatherError extends CurrentWeatherState {

  final String? message;

   CurrentWeatherError(this.message);
}
