import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/weather/domain/entity/forecast_7days_entity.dart';

@immutable
abstract class Forecast7DaysState extends Equatable  {}

class Forecast7DaysLoading extends Forecast7DaysState {
  @override
  List<Object?> get props => [];
}

class Forecast7DaysCompleted extends Forecast7DaysState {
  Forecast7DaysEntity? forecast7daysEntity;

  Forecast7DaysCompleted(this.forecast7daysEntity);
  @override
  List<Object?> get props => [forecast7daysEntity];

}

class Forecast7DaysError extends Forecast7DaysState {
  final String? error;

  Forecast7DaysError(this.error);

  @override
  List<Object?> get props => [error];
}
